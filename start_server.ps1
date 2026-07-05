# TerraDirect Local HTTP Server (Dependency-Free PowerShell Server)
# This script starts a lightweight web server on localhost and opens the app in your browser.

$port = 8080
$maxTries = 5
$listener = New-Object System.Net.HttpListener
$serverStarted = $false

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
if (-not $scriptDir) { $scriptDir = Get-Location }

# Find an available port
for ($i = 0; $i -lt $maxTries; $i++) {
    try {
        $listener.Prefixes.Clear()
        $listener.Prefixes.Add("http://localhost:$port/")
        $listener.Start()
        $serverStarted = $true
        break
    } catch {
        Write-Host "Port $port is in use. Trying next port..." -ForegroundColor Yellow
        $port++
    }
}

if (-not $serverStarted) {
    Write-Error "Could not find an available port to bind. Server exited."
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Green
Write-Host "   TerraDirect Web Server Started Successfully!" -ForegroundColor Green
Write-Host "   Running on: http://localhost:$port/index.html" -ForegroundColor Green
Write-Host "   Root directory: $scriptDir" -ForegroundColor Cyan
Write-Host "   Press [Ctrl + C] in this window to stop the server." -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Green

# Open browser
Start-Process "http://localhost:$port/index.html"

# Serve loop
try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        # Parse local filepath
        $urlPath = $request.Url.LocalPath
        if ($urlPath -eq "/" -or $urlPath -eq "") {
            $urlPath = "/index.html"
        }

        # Handle Windows path formatting
        $filePath = Join-Path $scriptDir $urlPath.Replace("/", "\")

        if (Test-Path $filePath -PathType Leaf) {
            # Determine content type
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".gif"  { "image/gif" }
                ".svg"  { "image/svg+xml" }
                ".ico"  { "image/x-icon" }
                default { "application/octet-stream" }
            }

            $response.ContentType = $contentType
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            
            Write-Host "Served ($($response.StatusCode)): $urlPath" -ForegroundColor Gray
        } else {
            # File not found
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 - File Not Found: $urlPath")
            $response.ContentType = "text/plain"
            $response.ContentLength64 = $errBytes.Length
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
            
            Write-Host "404 Not Found: $urlPath" -ForegroundColor Red
        }

        $response.OutputStream.Close()
    }
} catch {
    # Silence loop termination errors
} finally {
    if ($listener.IsListening) {
        $listener.Stop()
    }
    $listener.Close()
    Write-Host "Server stopped." -ForegroundColor Yellow
}

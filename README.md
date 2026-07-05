# TerraDirect - Preserving European Family Farming

**TerraDirect** is a digital agritourism and direct-sales platform designed to support private family-owned agricultural holdings in the EU. 

Every year, thousands of family farms disappear in the EU due to supermarket value-chain consolidation and demographic succession crises. TerraDirect bypasses corporate intermediaries entirely. By charging farmers 0% transaction commission on a flat monthly SaaS membership, we protect thin agricultural margins and return 100% of purchase values directly to rural communities.

This repository contains the interactive web application demo, visual assets, strategic reports, and local server launchers.

---

## 🌐 Live GitHub Pages Demo
Once you deploy this repository, it will be accessible globally at:
`https://var0a.github.io/TerraDirect/`

---

## 🌟 Key Application Features

*   **Multi-Country Compliance Simulator**: Switches between Germany (MwSt, BDSG/GDPR, Stripe Escrow), France (ACPR consignation, Egalim margin protection, 5.5% agricultural TVA), and the Netherlands (BTW 9%, Korteketenregeling, Triodos Bank).
*   **Accessibility Toolbar (Senior-Friendly)**:
    *   👤 **Senior Mode**: Automatically scales font size to `21px` and expands tap targets to `64px+` for elderly farmers and consumers.
    *   ◐ **High Contrast**: Restyles the app into a sunlight-legible AAA compliant dark theme for outdoor legibility.
    *   📄 **Simple View**: Simplifies the dashboard grid into a clean, single-column text layout with direct phone call links.
    *   🔊 **Voice Help**: Narrates farm profiles and instructions using the browser's Web Speech API at a slower pace (`0.90`) suitable for senior citizens.
*   **Interactive Vector Map**: A custom SVG-based map showing farm coordinates and pins in Bavaria, Provence, and South Holland.
*   **Three Example Farms**:
    1.  🐄 **Hof Miller (Germany)**: Dairy & Crops (Raw milk, fresh eggs, golden baking potatoes). Owner: Johann.
    2.  🏡 **Château de la Fontaine (France)**: Green Hostel & Artisanal Honey (Guesthouse stays, lavender honey, goat cheese wheels). Owner: Elise.
    3.  🍎 **De Windmolen Farm (Netherlands)**: Wind-powered Orchard & Poultry (Heirloom apples, sparkling apple cider, pastured chickens). Owner: Lars.
*   **Simulated Real-Time Chat**: Select preset questions and receive simulated, farm-specific answers from Johann, Elise, and Lars in real-time.
*   **Grading & Review System**: Star ratings and comment forms that recalculate average grades in real-time and persist in `localStorage`.





## 📁 Repository Directory Index

```
.
├── index.html            # Main Web Application Page (served by GitHub Pages)
├── README.md             # Repository Documentation (this file)
├── .gitignore            # Excludes temporary OS/Office files from git tracking
├── start_server.ps1      # Local HTTP Web Server script
├── start_server.bat      # Clickable launcher for the local server
├── storefront.html       # Legacy single-farm storefront mockup
├── rebuild_all.py        # Python asset and CSV spreadsheet rebuilder
├── create_presentation.scpt # macOS AppleScript for compiling strategic slides
├── data/                 # Buyer personas CSVs & SpreadsheetML Excel worksheets
├── visualizations/       # SVG age distribution and segment donut charts
└── reports/              # Project proposals, presenter scripts, and research analysis
```

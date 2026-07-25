# CursorFokus

A lightweight native macOS app that highlights the mouse cursor with a configurable ring and shows ripple effects on clicks.

![macOS 14+](https://img.shields.io/badge/macOS-14%2B-blue)
![Swift 6](https://img.shields.io/badge/Swift-6.0-orange)

## Features

- **Cursor highlight** — a ring that continuously follows the mouse pointer across all displays
- **Click ripple** — an expanding ring animation on left/right click that fades automatically
- **Per-display overlays** — transparent, click-through windows adapt to display changes
- **Configurable** — color, size, and opacity for cursor and left/right click highlights
- **Zero permissions required** — cursor tracking works immediately; click ripples are available if you grant Accessibility access
- **Menu bar icon** — quick access to settings and quit

## Quick start

```bash
make build       # compile + create .app bundle
make run         # build and launch
```

Or step by step:

```bash
swift build -c release
bash Scripts/build-app.sh
open Build/CursorFokus.app
```

## Usage

- **Cmd+,** or the menu bar icon → opens settings
- **Settings** window lets you enable/disable, pick colors, and adjust size/opacity for cursor, left-click, and right-click highlights
- The menu bar icon also provides a **Quit** option

## First-time setup

```bash
brew install swiftlint periphery pre-commit
pre-commit install
```

## Common tasks

```bash
make build       # compile + create .app bundle
make run         # build and launch
make format      # auto-format all Swift files
make lint        # run SwiftLint
make analyze     # run SwiftLint analyzer rules
make dead-code   # scan for unused declarations (Periphery)
make test        # run test suite (requires XcodeGen)
make precommit   # format + lint + analyze + dead-code + test
make clean       # remove build artifacts
```

## How it works

### Architecture

| Component | Role |
|-----------|------|
| `App/` | `@main` entry point, `AppDelegate` lifecycle, main menu setup |
| `Overlay/` | Transparent borderless `NSWindow` per display, `NSView` drawing cursor ring + ripple animation layers |
| `Tracking/` | 60fps cursor position polling via `NSEvent.mouseLocation`, global event monitor for clicks |
| `Settings/` | SwiftUI settings window, `@Observable` store backed by `UserDefaults` |
| `Extensions/` | Hex color serialization for `NSColor` and SwiftUI `Color` |

The app creates one full-screen transparent overlay per connected display. The overlay draws the cursor ring on every frame and spawns `CAShapeLayer` ripple animations on mouse clicks. Settings are read from `UserDefaults` on every draw, so changes take effect immediately.

### Build system

SwiftPM builds the executable. `Scripts/build-app.sh` wraps it into a proper `.app` bundle — no Xcode required. An XcodeGen project (`project.yml`) is available for UI testing and full Xcode integration.

## Structure

```
CursorFokus/
├── App/                 # Entry point, delegate, menu
├── Overlay/             # Overlay windows, view, manager
├── Tracking/            # Mouse position and click tracking
├── Settings/            # Settings store, SwiftUI view, window controller
├── Extensions/          # NSColor/Color hex extensions
└── Resources/           # Entitlements, asset catalog
Scripts/
├── build-app.sh         # .app bundle builder
└── swiftlint-analyze.sh # SwiftLint analyzer runner
```

## License

MIT — see [LICENSE](LICENSE).

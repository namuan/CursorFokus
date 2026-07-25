### Goal
A lightweight native macOS desktop app that highlights the mouse cursor and provides visual feedback for clicks.
Scope is strictly limited to:
- Cursor highlight (visible indicator that follows the pointer)
- Click highlight (visual indication when the mouse is clicked)

No other features.

### Tech Stack
- Swift + AppKit (or SwiftUI hybrid)
- Transparent, borderless, click-through overlay window(s) covering the display(s)
- Mouse position tracking via `NSEvent.mouseLocation` / `CGEvent`
- Click detection via global event monitors for mouse down events
- Basic settings stored in `UserDefaults`

### Core Features
1. **Cursor Highlight**
   A simple static visual indicator (circle or ring) that continuously follows the mouse cursor.
   Configurable: size, color, opacity.

2. **Click Highlight**
   A static visual indicator that appears at the click location when the left or right mouse button is pressed.
   Configurable: size, color, opacity (can differ for left vs right click).

3. **Very Basic Settings**
   Simple window with:
   - Color pickers for cursor highlight and click highlight
   - Size / opacity sliders
   - Enable / Disable toggles for each feature
   - Quit button

The app runs as a normal desktop application (Dock icon present). Overlay windows are created when the app launches and remain active while the app is running.

- Overlay windows are borderless, transparent, non-activating, and set to ignore mouse events.
- Cursor highlight is redrawn/moved on every mouse position update.
- Click highlight is shown at the click coordinates (static, no animation).

### Notes
- No menu-bar presence, no global hotkeys, no launch-at-login, no animations, no additional features.
- Keep the implementation minimal and focused solely on the two highlight types + basic settings.

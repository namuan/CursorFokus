import AppKit

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    private var overlayManager: OverlayWindowManager?
    private var mouseTracker: MouseTracker?
    private var settingsWindowController: SettingsWindowController?
    private var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create and show overlay windows on all connected displays
        overlayManager = OverlayWindowManager()
        overlayManager?.setup()

        // Start tracking mouse position and clicks
        mouseTracker = MouseTracker()
        mouseTracker?.onMouseMove = { [weak self] point in
            self?.overlayManager?.updateCursorPosition(point)
        }
        mouseTracker?.onMouseClick = { [weak self] point, isRightClick in
            self?.overlayManager?.showClick(at: point, isRightClick: isRightClick)
        }
        mouseTracker?.start()

        setupStatusItem()

        print("CursorFokus: Overlay windows created on \(NSScreen.screens.count) display(s).")
    }

    func applicationWillTerminate(_ notification: Notification) {
        mouseTracker?.stop()
        overlayManager?.teardown()
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        // Only bring existing settings to front; don't auto-open on reopen.
        if let window = settingsWindowController?.window, window.isVisible {
            window.makeKeyAndOrderFront(nil)
        }
        return true
    }

    @objc func openSettings() {
        print("CursorFokus: openSettings() called — showing settings window.")
        if settingsWindowController == nil {
            settingsWindowController = SettingsWindowController()
        }
        settingsWindowController?.showWindow(nil)
    }

    // MARK: - Status Bar

    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.image = NSImage(
            systemSymbolName: "cursorarrow.rays",
            accessibilityDescription: "CursorFokus"
        )

        let menu = NSMenu()
        let settingsItem = NSMenuItem(
            title: "Settings...",
            action: #selector(openSettings),
            keyEquivalent: ""
        )
        settingsItem.target = self
        menu.addItem(settingsItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(
            title: "Quit",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: ""
        ))

        statusItem?.menu = menu
    }

}

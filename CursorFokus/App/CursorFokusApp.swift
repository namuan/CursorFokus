import AppKit

@main
enum CursorFokusApp {
    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.setActivationPolicy(.regular)

        // Set up the main menu before entering the run loop
        setupMainMenu(delegate: delegate)

        app.run()
    }

    @MainActor private static func setupMainMenu(delegate: AppDelegate) {
        let mainMenu = NSMenu()

        // App menu
        let appMenuItem = NSMenuItem()
        let appMenu = NSMenu(title: "CursorFokus")
        appMenu.addItem(NSMenuItem(
            title: "About CursorFokus",
            action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)),
            keyEquivalent: ""
        ))
        appMenu.addItem(NSMenuItem.separator())
        let settingsItem = NSMenuItem(
            title: "Settings...",
            action: #selector(AppDelegate.openSettings),
            keyEquivalent: ","
        )
        settingsItem.target = delegate
        appMenu.addItem(settingsItem)
        appMenu.addItem(NSMenuItem.separator())
        appMenu.addItem(NSMenuItem(
            title: "Quit CursorFokus",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        ))
        appMenuItem.submenu = appMenu
        mainMenu.addItem(appMenuItem)

        NSApplication.shared.mainMenu = mainMenu
    }
}

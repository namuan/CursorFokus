import AppKit
import SwiftUI

final class SettingsWindowController: NSWindowController {
    convenience init() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 420, height: 540),
            styleMask: [.titled, .closable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        window.title = "CursorFokus"
        window.contentView = NSHostingView(rootView: SettingsView())
        window.center()

        self.init(window: window)
    }

    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
        window?.makeKeyAndOrderFront(sender)
    }
}

import AppKit

final class OverlayWindow: NSWindow {
    convenience init(screen: NSScreen) {
        self.init(
            contentRect: screen.frame,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false,
            screen: screen
        )
        configure()
    }

    private func configure() {
        isOpaque = false
        backgroundColor = .clear
        hasShadow = false
        ignoresMouseEvents = true
        level = .screenSaver
        collectionBehavior = [.canJoinAllSpaces, .ignoresCycle]
        isReleasedWhenClosed = false
        isMovableByWindowBackground = false
    }

    override var canBecomeKey: Bool { false }
    override var canBecomeMain: Bool { false }
}

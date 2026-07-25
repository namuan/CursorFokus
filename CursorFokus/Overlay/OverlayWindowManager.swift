import AppKit

@MainActor
final class OverlayWindowManager {
    private var overlays: [Int: OverlayWindow] = [:]

    func setup() {
        createOverlays()
        observeScreenChanges()
    }

    func teardown() {
        removeOverlays()
        NotificationCenter.default.removeObserver(self)
    }

    func updateCursorPosition(_ globalPoint: NSPoint) {
        for (_, window) in overlays {
            guard let view = window.contentView as? OverlayView else { continue }
            view.mouseLocation = globalPoint
            view.needsDisplay = true
        }
    }

    func showClick(at globalPoint: NSPoint, isRightClick: Bool) {
        for (_, window) in overlays {
            guard let view = window.contentView as? OverlayView else { continue }
            view.showClickRipple(at: globalPoint, isRightClick: isRightClick)
        }
    }

    // MARK: - Private

    private func createOverlays() {
        removeOverlays()
        for screen in NSScreen.screens {
            let window = OverlayWindow(screen: screen)
            let overlayView = OverlayView(frame: screen.frame)
            overlayView.screenOrigin = screen.frame.origin
            window.contentView = overlayView
            window.orderFrontRegardless()
            let screenNumber = (screen.deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")] as? Int) ?? 0
            overlays[screenNumber] = window
        }
    }

    private func removeOverlays() {
        for (_, window) in overlays {
            window.orderOut(nil)
            window.close()
        }
        overlays.removeAll()
    }

    private func observeScreenChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenParametersDidChange),
            name: NSApplication.didChangeScreenParametersNotification,
            object: nil
        )
    }

    @objc private func screenParametersDidChange(_ notification: Notification) {
        createOverlays()
    }
}

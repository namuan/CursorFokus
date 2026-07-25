import AppKit

@MainActor
final class MouseTracker {
    var onMouseMove: ((NSPoint) -> Void)?
    /// point in global display coordinates, isRightClick
    var onMouseClick: ((NSPoint, Bool) -> Void)?

    private var timer: Timer?
    private var globalMonitor: Any?
    private var lastPosition: NSPoint?

    func start() {
        // Poll cursor position at ~60 fps
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            MainActor.assumeIsolated {
                let position = NSEvent.mouseLocation
                if position != self.lastPosition {
                    self.lastPosition = position
                    self.onMouseMove?(position)
                }
            }
        }

        // Monitor mouse clicks globally (requires Accessibility permission)
        globalMonitor = NSEvent.addGlobalMonitorForEvents(
            matching: [.leftMouseDown, .rightMouseDown],
            handler: { [weak self] event in
                guard let self else { return }
                MainActor.assumeIsolated {
                    let location = NSEvent.mouseLocation
                    let isRightClick = event.type == .rightMouseDown
                    self.onMouseClick?(location, isRightClick)
                }
            }
        )
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        if let monitor = globalMonitor {
            NSEvent.removeMonitor(monitor)
            globalMonitor = nil
        }
        lastPosition = nil
    }
}

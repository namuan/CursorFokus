import AppKit

final class OverlayView: NSView {
    var screenOrigin: NSPoint = .zero
    var mouseLocation: NSPoint = .zero

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor.clear.cgColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isOpaque: Bool { false }

    override func draw(_ dirtyRect: NSRect) {
        let settings = SettingsStore.shared
        let localMouse = NSPoint(
            x: mouseLocation.x - screenOrigin.x,
            y: mouseLocation.y - screenOrigin.y
        )

        if settings.cursorEnabled {
            let color = NSColor(hex: settings.cursorHexColor) ?? .systemRed
            drawRing(at: localMouse, size: settings.cursorSize, color: color, opacity: settings.cursorOpacity)
        }
    }

    func showClickRipple(at globalPoint: NSPoint, isRightClick: Bool) {
        let settings = SettingsStore.shared
        let (enabled, hexColor, size, opacity) = isRightClick
            ? (settings.rightClickEnabled, settings.rightClickHexColor, settings.rightClickSize, settings.rightClickOpacity)
            : (settings.leftClickEnabled, settings.leftClickHexColor, settings.leftClickSize, settings.leftClickOpacity)

        guard enabled else { return }

        let localPoint = NSPoint(
            x: globalPoint.x - screenOrigin.x,
            y: globalPoint.y - screenOrigin.y
        )

        let color = NSColor(hex: hexColor) ?? .systemGreen
        let initialSize: CGFloat = size / 3
        let finalSize: CGFloat = size * 2.5
        let lineWidth: CGFloat = max(2, size / 10)

        let smallRect = CGRect(
            x: localPoint.x - initialSize / 2,
            y: localPoint.y - initialSize / 2,
            width: initialSize,
            height: initialSize
        )
        let largeRect = CGRect(
            x: localPoint.x - finalSize / 2,
            y: localPoint.y - finalSize / 2,
            width: finalSize,
            height: finalSize
        )

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = CGPath(ellipseIn: smallRect, transform: nil)
        shapeLayer.strokeColor = color.withAlphaComponent(opacity).cgColor
        shapeLayer.fillColor = NSColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth

        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = CGPath(ellipseIn: smallRect, transform: nil)
        pathAnimation.toValue = CGPath(ellipseIn: largeRect, transform: nil)

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0

        let group = CAAnimationGroup()
        group.animations = [pathAnimation, opacityAnimation]
        group.duration = 0.6
        group.timingFunction = CAMediaTimingFunction(name: .easeOut)
        group.fillMode = .forwards
        group.isRemovedOnCompletion = false

        layer?.addSublayer(shapeLayer)
        shapeLayer.add(group, forKey: "ripple")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak shapeLayer] in
            shapeLayer?.removeFromSuperlayer()
        }
    }

    private func drawRing(at point: NSPoint, size: Double, color: NSColor, opacity: Double) {
        let rect = NSRect(
            x: point.x - size / 2,
            y: point.y - size / 2,
            width: size,
            height: size
        )
        let path = NSBezierPath(ovalIn: rect)
        path.lineWidth = max(2, size / 10)
        color.withAlphaComponent(opacity).setStroke()
        path.stroke()
    }
}

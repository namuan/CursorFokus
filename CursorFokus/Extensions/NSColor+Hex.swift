import AppKit

extension NSColor {
    convenience init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard hex.count == 6 || hex.count == 8 else { return nil }

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: CGFloat
        if hex.count == 8 {
            r = CGFloat((int >> 24) & 0xFF) / 255
            g = CGFloat((int >> 16) & 0xFF) / 255
            b = CGFloat((int >> 8) & 0xFF) / 255
            a = CGFloat(int & 0xFF) / 255
        } else {
            r = CGFloat((int >> 16) & 0xFF) / 255
            g = CGFloat((int >> 8) & 0xFF) / 255
            b = CGFloat(int & 0xFF) / 255
            a = 1.0
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }

    var hexString: String {
        guard let rgb = usingColorSpace(.deviceRGB) ?? usingColorSpace(.sRGB) else {
            return "#FF0000FF"
        }
        let r = Int(clamping: Int(rgb.redComponent * 255))
        let g = Int(clamping: Int(rgb.greenComponent * 255))
        let b = Int(clamping: Int(rgb.blueComponent * 255))
        let a = Int(clamping: Int(rgb.alphaComponent * 255))
        return String(format: "#%02X%02X%02X%02X", r, g, b, a)
    }
}

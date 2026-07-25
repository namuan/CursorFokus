import AppKit

extension NSColor {
    convenience init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard hex.count == 6 || hex.count == 8 else { return nil }

        guard let int = UInt64(hex, radix: 16) else { return nil }

        let redValue: CGFloat
        let greenValue: CGFloat
        let blueValue: CGFloat
        let alphaValue: CGFloat
        if hex.count == 8 {
            redValue = CGFloat((int >> 24) & 0xFF) / 255
            greenValue = CGFloat((int >> 16) & 0xFF) / 255
            blueValue = CGFloat((int >> 8) & 0xFF) / 255
            alphaValue = CGFloat(int & 0xFF) / 255
        } else {
            redValue = CGFloat((int >> 16) & 0xFF) / 255
            greenValue = CGFloat((int >> 8) & 0xFF) / 255
            blueValue = CGFloat(int & 0xFF) / 255
            alphaValue = 1.0
        }
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }

    var hexString: String {
        guard let rgb = usingColorSpace(.deviceRGB) ?? usingColorSpace(.sRGB) else {
            return "#FF0000FF"
        }
        let redVal = Int(clamping: Int(rgb.redComponent * 255))
        let greenVal = Int(clamping: Int(rgb.greenComponent * 255))
        let blueVal = Int(clamping: Int(rgb.blueComponent * 255))
        let alphaVal = Int(clamping: Int(rgb.alphaComponent * 255))
        return String(format: "#%02X%02X%02X%02X", redVal, greenVal, blueVal, alphaVal)
    }
}

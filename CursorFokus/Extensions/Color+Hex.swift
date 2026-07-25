import SwiftUI

extension Color {
    init?(hex: String) {
        guard let nsColor = NSColor(hex: hex) else { return nil }
        self.init(nsColor: nsColor)
    }

    var hexString: String {
        NSColor(self).hexString
    }
}

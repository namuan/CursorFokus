import SwiftUI
import Testing
@testable import CursorFokus

struct ColorHexTests {

    @Test
    func colorInitWithValidHex() {
        let color = Color(hex: "#FF0000CC")
        #expect(color != nil)
    }

    @Test
    func colorInitWithInvalidHexReturnsNil() {
        let color = Color(hex: "not a hex")
        #expect(color == nil)
    }

    @Test
    func colorHexStringReturnsPrefixedHex() {
        guard let color = Color(hex: "#FF0000CC") else {
            Issue.record("Expected non-nil color from valid hex string")
            return
        }
        let hex = color.hexString
        #expect(hex.hasPrefix("#"))
        #expect(hex.count == 9)
    }
}

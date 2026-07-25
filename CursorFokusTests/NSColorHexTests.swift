import AppKit
import Testing
@testable import CursorFokus

struct NSColorHexTests {

    @Test
    func initWithSixCharHex() {
        let color = NSColor(hex: "#FF0000")
        #expect(color != nil)
    }

    @Test
    func initWithEightCharHex() {
        let color = NSColor(hex: "#FF0000CC")
        #expect(color != nil)
    }

    @Test
    func initWithoutHashPrefix() {
        let color = NSColor(hex: "FF0000")
        #expect(color != nil)
    }

    @Test
    func initWithInvalidHexReturnsNil() {
        let color = NSColor(hex: "GGGGGG")
        #expect(color == nil)
    }

    @Test
    func initWithTooShortHexReturnsNil() {
        let color = NSColor(hex: "FFF")
        #expect(color == nil)
    }

    @Test
    func initWithTooLongHexReturnsNil() {
        let color = NSColor(hex: "FFFFFFFFFFF")
        #expect(color == nil)
    }

    @Test
    func initWithEmptyStringReturnsNil() {
        let color = NSColor(hex: "")
        #expect(color == nil)
    }

    @Test
    func hexStringRoundTrip() {
        let input = "#FF0000CC"
        guard let color = NSColor(hex: input) else {
            Issue.record("Expected non-nil color from '\(input)'")
            return
        }
        let output = color.hexString
        #expect(output == "#FF0000CC")
    }

    @Test
    func redHexProducesRedColor() {
        guard let color = NSColor(hex: "#FF0000FF") else {
            Issue.record("Expected non-nil color from '#FF0000FF'")
            return
        }
        let red = Int(clamping: Int(color.redComponent * 255))
        #expect(red >= 250)
    }

    @Test
    func eightCharHexSetsAlpha() {
        guard let color = NSColor(hex: "#00000080") else {
            Issue.record("Expected non-nil color from '#00000080'")
            return
        }
        let alpha = Int(clamping: Int(color.alphaComponent * 255))
        #expect(alpha == 128)
    }

    @Test
    func sixCharHexDefaultsToOneAlpha() {
        guard let color = NSColor(hex: "#000000") else {
            Issue.record("Expected non-nil color from '#000000'")
            return
        }
        #expect(color.alphaComponent == 1.0)
    }
}

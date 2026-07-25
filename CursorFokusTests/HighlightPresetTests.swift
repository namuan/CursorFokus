import Testing
@testable import CursorFokus

struct HighlightPresetTests {

    @Test
    func presetsContainsEightEntries() {
        #expect(HighlightPreset.presets.count == 8)
    }

    @Test
    func defaultPresetHasExpectedId() {
        #expect(HighlightPreset.defaultPreset.id == "default")
    }

    @Test
    func defaultPresetHasExpectedName() {
        #expect(HighlightPreset.defaultPreset.name == "Default")
    }

    @Test
    func defaultPresetCursorEnabled() {
        #expect(HighlightPreset.defaultPreset.cursorEnabled == true)
    }

    @Test
    func defaultPresetCursorHexColor() {
        #expect(HighlightPreset.defaultPreset.cursorHexColor == "#FF0000CC")
    }

    @Test
    func defaultPresetCursorSize() {
        #expect(HighlightPreset.defaultPreset.cursorSize == 30)
    }

    @Test
    func defaultPresetCursorOpacity() {
        #expect(HighlightPreset.defaultPreset.cursorOpacity == 0.8)
    }

    @Test
    func minimalPresetHasLowerOpacity() {
        #expect(HighlightPreset.minimal.cursorOpacity == 0.4)
    }

    @Test
    func boldPresetHasFullOpacity() {
        #expect(HighlightPreset.bold.cursorOpacity == 1.0)
    }

    @Test
    func boldPresetHasLargerSize() {
        #expect(HighlightPreset.bold.cursorSize == 50)
    }

    @Test
    func neonPresetHasCyanCursor() {
        #expect(HighlightPreset.neon.cursorHexColor == "#00FFFFFF")
    }

    @Test
    func allPresetsHaveUniqueIds() {
        let ids = Set(HighlightPreset.presets.map { $0.id })
        #expect(ids.count == HighlightPreset.presets.count)
    }

    @Test
    func allPresetsHaveNames() {
        for preset in HighlightPreset.presets {
            #expect(!preset.name.isEmpty)
        }
    }

    @Test
    func identifiableConformsToIdentifiable() {
        let preset = HighlightPreset.defaultPreset
        #expect(preset.id == "default")
    }

    @Test
    func hashableConformsToHashable() {
        let lhs = HighlightPreset.defaultPreset
        let rhs = HighlightPreset.defaultPreset
        #expect(lhs.hashValue == rhs.hashValue)
    }
}

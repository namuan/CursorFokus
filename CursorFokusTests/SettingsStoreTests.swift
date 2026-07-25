import Testing
@testable import CursorFokus

@MainActor
struct SettingsStoreTests {

    let store: SettingsStore

    init() {
        let domain = "CursorFokusTests.SettingsStoreTests"
        UserDefaults.standard.removePersistentDomain(forName: domain)
        guard let defaults = UserDefaults(suiteName: domain) else {
            Issue.record("Failed to create UserDefaults with suite name '\(domain)'")
            fatalError("Test setup failed")
        }
        store = SettingsStore(defaults: defaults)
    }

    @Test
    func defaultCursorEnabledIsTrue() {
        #expect(store.cursorEnabled == true)
    }

    @Test
    func defaultCursorHexColor() {
        #expect(store.cursorHexColor == "#FF0000CC")
    }

    @Test
    func defaultCursorSize() {
        #expect(store.cursorSize == 30)
    }

    @Test
    func defaultCursorOpacity() {
        #expect(store.cursorOpacity == 0.8)
    }

    @Test
    func setAndGetCursorEnabled() {
        store.cursorEnabled = false
        #expect(store.cursorEnabled == false)
    }

    @Test
    func setAndGetCursorHexColor() {
        store.cursorHexColor = "#FFFFFFAA"
        #expect(store.cursorHexColor == "#FFFFFFAA")
    }

    @Test
    func setAndGetCursorSize() {
        store.cursorSize = 50
        #expect(store.cursorSize == 50)
    }

    @Test
    func setAndGetCursorOpacity() {
        store.cursorOpacity = 0.5
        #expect(store.cursorOpacity == 0.5)
    }

    @Test
    func defaultLeftClickEnabledIsTrue() {
        #expect(store.leftClickEnabled == true)
    }

    @Test
    func defaultRightClickEnabledIsTrue() {
        #expect(store.rightClickEnabled == true)
    }

    @Test
    func applyPresetUpdatesAllValues() {
        let preset = HighlightPreset(
            id: "test",
            name: "Test",
            cursorEnabled: false,
            cursorHexColor: "#AABBCCDD",
            cursorSize: 44,
            cursorOpacity: 0.3,
            leftClickEnabled: false,
            leftClickHexColor: "#BBCCDDEE",
            leftClickSize: 55,
            leftClickOpacity: 0.4,
            rightClickEnabled: false,
            rightClickHexColor: "#CCDDEEFF",
            rightClickSize: 66,
            rightClickOpacity: 0.5
        )

        store.applyPreset(preset)

        #expect(store.cursorEnabled == false)
        #expect(store.cursorHexColor == "#AABBCCDD")
        #expect(store.cursorSize == 44)
        #expect(store.cursorOpacity == 0.3)
        #expect(store.leftClickEnabled == false)
        #expect(store.leftClickHexColor == "#BBCCDDEE")
        #expect(store.leftClickSize == 55)
        #expect(store.leftClickOpacity == 0.4)
        #expect(store.rightClickEnabled == false)
        #expect(store.rightClickHexColor == "#CCDDEEFF")
        #expect(store.rightClickSize == 66)
        #expect(store.rightClickOpacity == 0.5)
    }
}

import Foundation
import Observation

enum SettingsKeys {
    // Cursor
    static let cursorEnabled = "cursorEnabled"
    static let cursorColorHex = "cursorColorHex"
    static let cursorSize = "cursorSize"
    static let cursorOpacity = "cursorOpacity"

    // Left click
    static let leftClickEnabled = "leftClickEnabled"
    static let leftClickColorHex = "leftClickColorHex"
    static let leftClickSize = "leftClickSize"
    static let leftClickOpacity = "leftClickOpacity"

    // Right click
    static let rightClickEnabled = "rightClickEnabled"
    static let rightClickColorHex = "rightClickColorHex"
    static let rightClickSize = "rightClickSize"
    static let rightClickOpacity = "rightClickOpacity"
}

@MainActor
@Observable
final class SettingsStore {
    static let shared = SettingsStore()

    private let defaults = UserDefaults.standard

    // MARK: - Cursor highlight

    var cursorEnabled: Bool {
        get { defaults.object(forKey: SettingsKeys.cursorEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: SettingsKeys.cursorEnabled) }
    }

    var cursorHexColor: String {
        get { defaults.string(forKey: SettingsKeys.cursorColorHex) ?? "#FF0000CC" }
        set { defaults.set(newValue, forKey: SettingsKeys.cursorColorHex) }
    }

    var cursorSize: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.cursorSize)
            return value == 0 ? 30 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.cursorSize) }
    }

    var cursorOpacity: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.cursorOpacity)
            return value == 0 ? 0.8 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.cursorOpacity) }
    }

    // MARK: - Left click highlight

    var leftClickEnabled: Bool {
        get { defaults.object(forKey: SettingsKeys.leftClickEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: SettingsKeys.leftClickEnabled) }
    }

    var leftClickHexColor: String {
        get { defaults.string(forKey: SettingsKeys.leftClickColorHex) ?? "#00FF00CC" }
        set { defaults.set(newValue, forKey: SettingsKeys.leftClickColorHex) }
    }

    var leftClickSize: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.leftClickSize)
            return value == 0 ? 40 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.leftClickSize) }
    }

    var leftClickOpacity: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.leftClickOpacity)
            return value == 0 ? 0.8 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.leftClickOpacity) }
    }

    // MARK: - Right click highlight

    var rightClickEnabled: Bool {
        get { defaults.object(forKey: SettingsKeys.rightClickEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: SettingsKeys.rightClickEnabled) }
    }

    var rightClickHexColor: String {
        get { defaults.string(forKey: SettingsKeys.rightClickColorHex) ?? "#0000FFCC" }
        set { defaults.set(newValue, forKey: SettingsKeys.rightClickColorHex) }
    }

    var rightClickSize: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.rightClickSize)
            return value == 0 ? 40 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.rightClickSize) }
    }

    var rightClickOpacity: Double {
        get {
            let value = defaults.double(forKey: SettingsKeys.rightClickOpacity)
            return value == 0 ? 0.8 : value
        }
        set { defaults.set(newValue, forKey: SettingsKeys.rightClickOpacity) }
    }

    func applyPreset(_ preset: HighlightPreset) {
        cursorEnabled = preset.cursorEnabled
        cursorHexColor = preset.cursorHexColor
        cursorSize = preset.cursorSize
        cursorOpacity = preset.cursorOpacity

        leftClickEnabled = preset.leftClickEnabled
        leftClickHexColor = preset.leftClickHexColor
        leftClickSize = preset.leftClickSize
        leftClickOpacity = preset.leftClickOpacity

        rightClickEnabled = preset.rightClickEnabled
        rightClickHexColor = preset.rightClickHexColor
        rightClickSize = preset.rightClickSize
        rightClickOpacity = preset.rightClickOpacity
    }

    private init() {}
}

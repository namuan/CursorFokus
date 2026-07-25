struct HighlightPreset: Identifiable, Hashable {
    let id: String
    let name: String

    let cursorEnabled: Bool
    let cursorHexColor: String
    let cursorSize: Double
    let cursorOpacity: Double

    let leftClickEnabled: Bool
    let leftClickHexColor: String
    let leftClickSize: Double
    let leftClickOpacity: Double

    let rightClickEnabled: Bool
    let rightClickHexColor: String
    let rightClickSize: Double
    let rightClickOpacity: Double

    static let presets: [HighlightPreset] = [
        .defaultPreset,
        .minimal,
        .bold,
        .neon,
        .subtle,
        .monochrome,
        .laser,
        .solarized,
    ]
}

extension HighlightPreset {
    static let defaultPreset = HighlightPreset(
        id: "default",
        name: "Default",
        cursorEnabled: true,
        cursorHexColor: "#FF0000CC",
        cursorSize: 30,
        cursorOpacity: 0.8,
        leftClickEnabled: true,
        leftClickHexColor: "#00FF00CC",
        leftClickSize: 40,
        leftClickOpacity: 0.8,
        rightClickEnabled: true,
        rightClickHexColor: "#0000FFCC",
        rightClickSize: 40,
        rightClickOpacity: 0.8
    )

    static let minimal = HighlightPreset(
        id: "minimal",
        name: "Minimal",
        cursorEnabled: true,
        cursorHexColor: "#666666CC",
        cursorSize: 18,
        cursorOpacity: 0.4,
        leftClickEnabled: true,
        leftClickHexColor: "#888888CC",
        leftClickSize: 22,
        leftClickOpacity: 0.3,
        rightClickEnabled: true,
        rightClickHexColor: "#AAAAAACC",
        rightClickSize: 22,
        rightClickOpacity: 0.3
    )

    static let bold = HighlightPreset(
        id: "bold",
        name: "Bold",
        cursorEnabled: true,
        cursorHexColor: "#FF0000FF",
        cursorSize: 50,
        cursorOpacity: 1.0,
        leftClickEnabled: true,
        leftClickHexColor: "#00FF00FF",
        leftClickSize: 60,
        leftClickOpacity: 1.0,
        rightClickEnabled: true,
        rightClickHexColor: "#0000FFFF",
        rightClickSize: 60,
        rightClickOpacity: 1.0
    )

    static let neon = HighlightPreset(
        id: "neon",
        name: "Neon",
        cursorEnabled: true,
        cursorHexColor: "#00FFFFFF",
        cursorSize: 35,
        cursorOpacity: 0.9,
        leftClickEnabled: true,
        leftClickHexColor: "#FF00FFFF",
        leftClickSize: 45,
        leftClickOpacity: 0.9,
        rightClickEnabled: true,
        rightClickHexColor: "#FFFF00FF",
        rightClickSize: 45,
        rightClickOpacity: 0.9
    )

    static let subtle = HighlightPreset(
        id: "subtle",
        name: "Subtle",
        cursorEnabled: true,
        cursorHexColor: "#FF9999CC",
        cursorSize: 24,
        cursorOpacity: 0.3,
        leftClickEnabled: true,
        leftClickHexColor: "#99FF99CC",
        leftClickSize: 28,
        leftClickOpacity: 0.3,
        rightClickEnabled: true,
        rightClickHexColor: "#9999FFCC",
        rightClickSize: 28,
        rightClickOpacity: 0.3
    )

    static let monochrome = HighlightPreset(
        id: "monochrome",
        name: "Monochrome",
        cursorEnabled: true,
        cursorHexColor: "#FFFFFFFF",
        cursorSize: 30,
        cursorOpacity: 0.8,
        leftClickEnabled: true,
        leftClickHexColor: "#FFFFFFCC",
        leftClickSize: 40,
        leftClickOpacity: 0.6,
        rightClickEnabled: true,
        rightClickHexColor: "#FFFFFFCC",
        rightClickSize: 40,
        rightClickOpacity: 0.6
    )

    static let laser = HighlightPreset(
        id: "laser",
        name: "Laser",
        cursorEnabled: true,
        cursorHexColor: "#FF0000FF",
        cursorSize: 14,
        cursorOpacity: 1.0,
        leftClickEnabled: true,
        leftClickHexColor: "#FF0000FF",
        leftClickSize: 20,
        leftClickOpacity: 1.0,
        rightClickEnabled: true,
        rightClickHexColor: "#FF0000FF",
        rightClickSize: 20,
        rightClickOpacity: 1.0
    )

    static let solarized = HighlightPreset(
        id: "solarized",
        name: "Solarized",
        cursorEnabled: true,
        cursorHexColor: "#268BD2CC",
        cursorSize: 30,
        cursorOpacity: 0.8,
        leftClickEnabled: true,
        leftClickHexColor: "#859900CC",
        leftClickSize: 40,
        leftClickOpacity: 0.8,
        rightClickEnabled: true,
        rightClickHexColor: "#DC322FCC",
        rightClickSize: 40,
        rightClickOpacity: 0.8
    )
}

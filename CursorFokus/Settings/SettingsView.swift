import SwiftUI

struct SettingsView: View {
    @State private var store = SettingsStore.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HighlightSection(
                    title: "Cursor Highlight",
                    enabled: $store.cursorEnabled,
                    hexColor: $store.cursorHexColor,
                    size: $store.cursorSize,
                    opacity: $store.cursorOpacity
                )

                Divider()

                HighlightSection(
                    title: "Left Click Highlight",
                    enabled: $store.leftClickEnabled,
                    hexColor: $store.leftClickHexColor,
                    size: $store.leftClickSize,
                    opacity: $store.leftClickOpacity
                )

                Divider()

                HighlightSection(
                    title: "Right Click Highlight",
                    enabled: $store.rightClickEnabled,
                    hexColor: $store.rightClickHexColor,
                    size: $store.rightClickSize,
                    opacity: $store.rightClickOpacity
                )

                Divider()

                HStack {
                    Spacer()
                    Button("Quit") {
                        NSApplication.shared.terminate(nil)
                    }
                    .keyboardShortcut("q", modifiers: [.command])
                }
            }
            .padding()
        }
        .frame(minWidth: 400)
    }
}

private struct HighlightSection: View {
    let title: String
    @Binding var enabled: Bool
    @Binding var hexColor: String
    @Binding var size: Double
    @Binding var opacity: Double

    private var colorBinding: Binding<Color> {
        Binding<Color>(
            get: { Color(hex: hexColor) ?? .red },
            set: { hexColor = $0.hexString }
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)

            Toggle("Enabled", isOn: $enabled)

            ColorPicker("Color", selection: colorBinding)

            HStack {
                Text("Size")
                Slider(value: $size, in: 10...100)
                Text("\(Int(size))")
                    .frame(width: 30, alignment: .trailing)
            }

            HStack {
                Text("Opacity")
                Slider(value: $opacity, in: 0.1...1.0)
                Text("\(Int(opacity * 100))%")
                    .frame(width: 40, alignment: .trailing)
            }
        }
    }
}

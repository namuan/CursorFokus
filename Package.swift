// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CursorFokus",
    platforms: [
        .macOS(.v14)
    ],
    targets: [
        .executableTarget(
            name: "CursorFokus",
            path: "CursorFokus",
            resources: [.process("Resources")],
        ),
    ]
)

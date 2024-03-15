// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GoogleTranslateSwift",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GoogleTranslateSwift",
            targets: ["GoogleTranslateSwift"]),
    ],
    targets: [
        .target(
            name: "GoogleTranslateSwift"),
        .testTarget(
            name: "GoogleTranslateSwiftTests",
            dependencies: ["GoogleTranslateSwift"]),
    ]
)

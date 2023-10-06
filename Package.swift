// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-unit",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipUnit", type: .dynamic, targets: ["SkipUnit"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.6.96"),
    ],
    targets: [
        .target(name: "SkipUnit", plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipUnitTests", dependencies: ["SkipUnit", .product(name: "SkipTest", package: "skip", condition: .when(platforms: [.macOS]))], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

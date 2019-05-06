// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionalSwiftHelper",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "FunctionalSwiftHelper",
            targets: ["FunctionalSwiftHelper"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FunctionalSwiftHelper",
            dependencies: [],
            path: "./FunctionalSwiftHelper/Classes")
    ],
    swiftLanguageVersions: [.v5]
)

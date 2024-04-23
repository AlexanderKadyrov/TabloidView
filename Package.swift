// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabloidView",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "TabloidView",
            targets: [
                "TabloidView"
            ]
        )
    ],
    dependencies: [
        .package(name: "DifferenceKit", url: "https://github.com/ra1028/DifferenceKit.git", .exact("1.3.0"))
    ],
    targets: [
        .target(
            name: "TabloidView",
            dependencies: [
                "DifferenceKit"
            ]
        )
    ]
)

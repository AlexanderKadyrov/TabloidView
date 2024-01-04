// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabloidView",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
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
    
    ],
    targets: [
        .target(
            name: "TabloidView",
            dependencies: [
                
            ]
        )
    ]
)

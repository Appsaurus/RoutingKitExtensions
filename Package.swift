// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RoutingKitExtensions",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "RoutingKitExtensions",
            targets: [
                "RoutingKitExtensions",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/routing-kit", from: "4.0.0"),
    ],
    targets: [

        .target(
            name: "RoutingKitExtensions",
            dependencies: [
                .product(name: "RoutingKit", package: "routing-kit"),
            ],
            path: "Sources/RoutingKitExtensions/",
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "RoutingKitExtensionsTests",
            dependencies: [
                "RoutingKitExtensions",
            ],
            path: "Tests/RoutingKitExtensions/",
            exclude: [
                "Resources/README.md",
                "Toolbox/README.md",
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)

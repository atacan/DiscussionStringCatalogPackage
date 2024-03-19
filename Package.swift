// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiscussionStringCatalogPackage",
    defaultLocalization: "en",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DiscussionStringCatalogPackage",
            targets: ["DiscussionStringCatalogPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DiscussionStringCatalogPackage",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "DiscussionStringCatalogPackageTests",
            dependencies: ["DiscussionStringCatalogPackage"]),
    ]
)

// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FLAlertView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "FLAlertView",
            targets: ["FLAlertView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "FLAlertView",
            dependencies: []),
    ]
)

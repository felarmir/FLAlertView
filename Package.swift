// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FLAlertView",
    products: [
        .library(
            name: "FLAlertView",
            targets: ["FLAlertView"]),
    ],
    targets: [
        .target(
            name: "FLAlertView",
            path: "FLAlertView"
        ),
    ]
)

// swift-tools-version:5.3
//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.
// Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import PackageDescription

let package = Package(
    name: "OWArcadeTodayAPI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "OWArcadeTodayAPI",
            targets: ["OWArcadeTodayAPI"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
        .package(url: "https://github.com/mxcl/PromiseKit", from: "6.8.0"),
        .package(url: "https://github.com/ivlevAstef/DITranquillity.git", from: "4.1.4"),
        .package(path: "../AppCoreKit")
    ],
    targets: [
        .target(
            name: "OWArcadeTodayAPI",
            dependencies: [
                "Alamofire",
                "PromiseKit",
                "DITranquillity",
                "AppCoreKit"
            ])
    ]
)

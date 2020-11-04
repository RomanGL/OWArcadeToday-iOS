// swift-tools-version:5.3
//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.
// Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import PackageDescription

let package = Package(
    name: "AppCoreKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AppCoreKit",
            targets: ["AppCoreKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/ivlevAstef/DITranquillity.git", from: "4.1.4")
    ],
    targets: [
        .target(
            name: "AppCoreKit",
            dependencies: ["DITranquillity"])
    ]
)

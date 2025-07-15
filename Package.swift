// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bagua",
    platforms: [
      .iOS(.v13),
      .watchOS(.v5),
      .macOS(.v10_14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Bagua",
            targets: ["Bagua"]
        ),
    ],
    dependencies: [
      .package(url: "https://github.com/airbnb/swift", from: "1.0.0"),
      .package(url: "https://github.com/xiangyu-sun/ChineseAstrologyCalendar", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Bagua",
            dependencies: [
              .product(name: "ChineseAstrologyCalendar", package: "ChineseAstrologyCalendar"),
            ]),
        .testTarget(
            name: "BaguaTests",
            dependencies: ["Bagua"]),
    ]
)

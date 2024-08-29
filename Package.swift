// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "UnimplementedGRDB",
  platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "UnimplementedGRDB",
      targets: ["UnimplementedGRDB"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/groue/GRDB.swift", from: "6.29.0"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.2.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "UnimplementedGRDB",
      dependencies: [
        .product(name: "GRDB", package: "GRDB.swift"),
        .product(name: "IssueReporting", package: "xctest-dynamic-overlay")
      ]
    ),
    .testTarget(
      name: "UnimplementedGRDBTests",
      dependencies: ["UnimplementedGRDB"]
    ),
  ]
)

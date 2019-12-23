// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GithubAPI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GithubAPI",
            targets: ["GithubAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.9.1")
    ],
    targets: [
        .target(
            name: "GithubAPI",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "GithubAPITests",
            dependencies: ["GithubAPI"]),
    ]
)

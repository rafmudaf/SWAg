// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "swa_tools",
  dependencies: [
    .Package(url: "https://github.com/Alamofire/Alamofire.git", majorVersion: 4),
    .Package(url: "https://github.com/nolanw/HTMLReader", majorVersion: 2)
  ]
)

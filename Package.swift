// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ZXingCppWrapper",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ZXingCppWrapper",
            type: .static,
            targets: ["ZXingCppWrapper"])
    ],
    targets: [
        .binaryTarget(
            name: "ZXingCpp",
            url: "https://github.com/Kristijan22/zxing-cpp-ios-xcframework/releases/download/0.0.0/ZXingCpp.xcframework.zip",
            checksum: "000"
        ),
        .target(
            name: "ZXingCppWrapper",
            dependencies: ["ZXingCpp"],
            path: "zxing-cpp/wrappers/ios/Sources/Wrapper",
            publicHeadersPath: ".",
            cxxSettings: [
                .unsafeFlags(["-stdlib=libc++"]),
                .unsafeFlags(["-std=gnu++17"])
            ]
        )
    ]
)

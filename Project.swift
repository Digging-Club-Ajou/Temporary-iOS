import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
 +-------------+
 |             |
 |     App     | Contains Diggle App target and Diggle unit-test target
 |             |
 +------+-------------+-------+
 |         depends on         |
 |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+
 
 */

// MARK: - Project
let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
    "NSCameraUsageDescription": "‘앨범’, ‘멜로디카드’ 등의 게시물 등록을 위해 카메라에 접근하도록 허용합니다.",
    "NSLocationWhenInUseUsageDescription" : "‘앨범’, ‘멜로디카드’ 등의 게시물 등록을 위해 위치 권한에 접근하도록 허용합니다.",
    "NSPhotoLibraryUsageDescription": "‘앨범’, ‘멜로디카드’ 등의 게시물 등록을 위해 사진에 접근하도록 허용합니다."
]

let target = Target(
    name: "Diggle",
    platform: .iOS,
    product: .app,
    bundleId: "com.diggle.ajou",
    infoPlist: .extendingDefault(with: infoPlist),
    sources: ["Targets/Diggle/Sources/**"],
    resources: ["Targets/Diggle/Resources/**"],
    dependencies: [
        .package(product: "KakaoSDKAuth"),
        .package(product: "KakaoSDKCommon"),
        .package(product: "KakaoSDKUser"),
        .package(product: "ComposableArchitecture"),
        .package(product: "SwiftUIIntrospect"),
        .package(product: "Kingfisher")
    ]
)

let testTarget = Target(
    name: "DiggleTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.diggle.ajou.test",
    sources: ["Targets/Diggle/Tests/**"],
    dependencies: [
        .package(product: "ComposableArchitecture"),
        .target(name: "Diggle")
    ]
)

let project = Project(name: "Diggle",
                      organizationName: "DiggleAjou",
                      packages: [
                        .remote(url: "https://github.com/siteline/swiftui-introspect.git", requirement: .upToNextMajor(from: "1.1.0")),
                        .remote(url: "https://github.com/kakao/kakao-ios-sdk.git",
                                requirement: .upToNextMajor(from: "2.17.0")),
                        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture.git", requirement: .upToNextMajor(from: "1.2.0")),
                        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.9.1"))
                      ],
                      settings: nil,
                      targets: [target, testTarget]
)

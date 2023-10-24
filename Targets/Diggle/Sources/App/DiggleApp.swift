import SwiftUI
import ComposableArchitecture
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DiggleApp: App {
    
    @StateObject private var diggleTabManager = DiggleTabManager.shared
    @StateObject private var accountManager = AccountManager.shared
    @StateObject private var navigateUploadManager = NavigateUploadManager.shared
    
    init() {
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .onOpenURL {
                    if AuthApi.isKakaoTalkLoginUrl($0) {
                        _ = AuthController.handleOpenUrl(url: $0)
                    }
                }
                .environmentObject(diggleTabManager)
                .environmentObject(accountManager)
                .environmentObject(navigateUploadManager)
        }
    }
}

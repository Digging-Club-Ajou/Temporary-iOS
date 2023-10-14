import SwiftUI
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
            DiggleTabView()
                .environmentObject(diggleTabManager)
                .environmentObject(accountManager)
                .environmentObject(navigateUploadManager)
                .onOpenURL {
                    if AuthApi.isKakaoTalkLoginUrl($0) {
                        _ = AuthController.handleOpenUrl(url: $0)
                    }
                }
        }
    }
}

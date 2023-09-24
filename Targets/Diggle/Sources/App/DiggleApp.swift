import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DiggleApp: App {
    
    init() {
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .onOpenURL {
                    if AuthApi.isKakaoTalkLoginUrl($0) {
                        AuthController.handleOpenUrl(url: $0)
                    }
                }
        }
    }
}

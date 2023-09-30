import SwiftUI
import ComposableArchitecture
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DiggleApp: App {
    
    init() {
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    var body: some Scene {
        WindowGroup {
//            LoginView()
            AuthorityView(store: Store(initialState: AuthorityFeature.State(),
                                       reducer: {
                AuthorityFeature()
            }))
                .onOpenURL {
                    if AuthApi.isKakaoTalkLoginUrl($0) {
                        AuthController.handleOpenUrl(url: $0)
                    }
                }
        }
    }
}

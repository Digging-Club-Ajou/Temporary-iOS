//
//  LoginViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUI
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

final class LoginViewModel: ObservableObject {
    @Published private(set) var model = LoginModel()
    
    private let accountService = AccountService()
    
    func onKakaoLoginButtonTapped() {

        
        guard !AuthApi.hasToken()
        else { return debugPrint("Token exist")}
        
        
        if UserApi.isKakaoTalkLoginAvailable() {
            
            UserApi.shared.loginWithKakaoTalk { oAuthToken, error in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                
                    // 사용자의 액세스 토큰 출력
                    if let oAuthToken = oAuthToken {
                        debugPrint("oAuthToken: \(oAuthToken)")
                    }
                }
            }
        } else {
            debugPrint("kakao login disable")
        }
    }
    
    func onButtonTapped() {
        Task {
            await accountService.getKakaoAuthCode()
        }
    }
    
    func loadingInfoDidKakaoAuth() {  // 사용자 정보 불러오기
        UserApi.shared.me { kakaoUser, error in
            if let error = error {
                print("카카오톡 사용자 정보 불러오는데 실패했습니다.")
                return
            }
            guard let email = kakaoUser?.kakaoAccount?.email else { return }
            guard let password = kakaoUser?.id else { return }
            guard let userName = kakaoUser?.kakaoAccount?.profile?.nickname else { return }
        }
    }
    
    func onAppear() {
        
        UserApi.shared.logout { error in
            if let error = error {
            } else {
                debugPrint("Logout sucess")
            }
        }
    }
}

extension LoginViewModel {
    var tabSelectionBinding: Binding<LoginInformationState> {
        .init {
            self.model.informationState
        } set: { newValue in
            self.model.informationState = newValue
        }
        
    }
}

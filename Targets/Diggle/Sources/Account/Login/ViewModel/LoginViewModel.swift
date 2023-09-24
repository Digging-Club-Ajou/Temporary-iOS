//
//  LoginViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUI
import KakaoSDKUser

final class LoginViewModel: ObservableObject {
    @Published private(set) var model = LoginModel()
    
    func onKakaoLoginButtonTapped() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oAuthToken, error in
                self.getKakaoUserInfo()
            }
        } else {
            debugPrint("kakao login disable")
        }
    }
    
    func getKakaoUserInfo() {
        UserApi.shared.me { (user, error) in
            
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

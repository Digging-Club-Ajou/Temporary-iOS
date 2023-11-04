//
//  KakaoWebModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct KakaoWebModel {
    
    var authCode: String? {
        let components = currentURL.components(separatedBy: "code=")
        return components.last
    }
    
    let url = "https://kauth.kakao.com/oauth/authorize?client_id=\(kakaoRestAPIKey)&redirect_uri=\(kakaoRedirectURI)&response_type=code"
    
    var currentURL: String = "" {
        willSet {
            debugPrint("currentURL willSet \(newValue)")
        } didSet {
            debugPrint("authCode: \(authCode)")
        }
    }
    
    var isAuthCodeObtained: Bool {
        authCode != nil
    }
}

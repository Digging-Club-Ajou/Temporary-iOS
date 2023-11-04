//
//  AccountService.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/12.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Alamofire
import KakaoSDKUser

struct AccountService {
    func kakaoLogin(kakaoAccessToken: String) async throws -> KakaoLoginResposne {
        let url = "\(baseURL)/api/kakao"
        
        let response = await AF.request(url,
                                        method: .post,
                                        encoding: JSONEncoding.default)
            .serializingDecodable(KakaoLoginResposne.self).response
        
        
        switch response.result {
        case .success(let loginResposne):
            return loginResposne
        case .failure(let err):
            throw err
        }
    }
    
    func getKakaoAuthCode() async {
        let url = "https://kauth.kakao.com/oauth/authorize?client_id=\(kakaoRestAPIKey)&redirect_uri=\(kakaoRedirectURI)&response_type=code"
        
        let response = await AF.request(url,
                                        method: .get,
                                        encoding: JSONEncoding.default)
            .serializingDecodable(KakaoLoginResposne.self).response
        
        debugPrint(response.debugDescription)
    }
}

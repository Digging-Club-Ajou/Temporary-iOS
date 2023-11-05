//
//  AccountService.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/12.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Alamofire
import KakaoSDKUser

final class AccountService: AccountServiceProtocol {
    static let shared = AccountService()
    
    private var nicknameValidationTask: Task<ValidateNicknameResponse, Error>?

    func cancelNicknameValidation() {
        nicknameValidationTask?.cancel()
        nicknameValidationTask = nil
    }
    
    func getKakaoAuthCode() async {
        let url = "https://kauth.kakao.com/oauth/authorize?client_id=\(kakaoRestAPIKey)&redirect_uri=\(kakaoRedirectURI)&response_type=code"
        
        let response = await AF.request(url,
                                        method: .get,
                                        encoding: JSONEncoding.default)
            .serializingDecodable(KakaoLoginResposne.self).response
    }
    
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
    
    func postFavoriteArtist(aritsts: FavoriteArtistRequest) async throws {
        let url = "\(baseURL)/api/artists"
        let header = RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                        method: .post,
                                        parameters: aritsts,
                                        encoder: JSONParameterEncoder.default,
                                        headers: header)
            .serializingDecodable(StatusCodeResposne.self).result
        
        switch result {
        case .success(_):
            break
        case .failure(let failure):
            throw failure
        }
    }
    
    func postFavroiteGenere(genres: FavoriteGenereRequest) async throws {
        let url = "\(baseURL)/api/genres"
        let header = RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                        method: .post,
                                        parameters: genres,
                                        encoder: JSONParameterEncoder.default,
                                        headers: header)
            .serializingDecodable(StatusCodeResposne.self).result
        
        switch result {
        case .success(_):
            break
        case .failure(let failure):
            throw failure
        }
    }
    
    func postNickname(request: PostNicknameRequest) async throws -> PostNicknameResponse {
        let url = "\(baseURL)/api/nickname"
        let header = RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                        method: .post,
                                        parameters: request,
                                        encoder: JSONParameterEncoder.default,
                                        headers: header)
            .serializingDecodable(PostNicknameResponse.self).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            throw failure
        }
    }

    func validateNickname(request: ValidateNicknameRequest) async throws -> ValidateNicknameResponse {
        let url = "\(baseURL)/api/nickname-validation"
        let header = RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                        method: .post,
                                        parameters: request,
                                        encoder: JSONParameterEncoder.default,
                                        headers: header)
            .serializingDecodable(ValidateNicknameResponse.self).result
        
        nicknameValidationTask = Task {
            switch result {
            case .success(let response):
                return response
            case .failure(let failure):
                throw failure
            }
        }
        
        if let nicknameValidationTask = nicknameValidationTask {
            return try await nicknameValidationTask.value
        } else {
            throw TaskHandleError.taskCreationFailure
        }
    }
}

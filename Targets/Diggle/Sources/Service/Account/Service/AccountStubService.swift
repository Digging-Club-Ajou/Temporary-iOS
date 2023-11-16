//
//  AccountStubService.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/04.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class AccountStubService: AccountServiceProtocol {
    func getUserInfo() async throws -> UserInfoResponse {
        return .stub()
    }
    
    func cancelNicknameValidation() {
        
    }
    
    func validateNickname(request: ValidateNicknameRequest) async throws -> Task<ValidateNicknameResponse, Error> {
        return Task { return .stub() }
    }
    
    func postFavoriteArtist(aritsts: FavoriteArtistRequest) async throws {
        
    }
    
    func postFavroiteGenere(genres: FavoriteGenereRequest) async throws {
        
    }
    
    func validateNickname(request: ValidateNicknameRequest) async throws -> ValidateNicknameResponse {
        return .stub()
    }
    
    func postNickname(request: PostNicknameRequest) async throws -> PostNicknameResponse {
        return .stub()
    }
}

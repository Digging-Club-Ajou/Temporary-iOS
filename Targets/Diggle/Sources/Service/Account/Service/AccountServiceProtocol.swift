//
//  AccountServiceProtocol.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/04.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

protocol AccountServiceProtocol {
    func postFavoriteArtist(aritsts: FavoriteArtistRequest) async throws
    
    func postFavroiteGenere(genres: FavoriteGenereRequest) async throws
    
    func validateNickname(request: ValidateNicknameRequest) async throws -> ValidateNicknameResponse
    
    func cancelNicknameValidation() 
    
    @discardableResult
    func postNickname(request: PostNicknameRequest) async throws -> PostNicknameResponse 
}

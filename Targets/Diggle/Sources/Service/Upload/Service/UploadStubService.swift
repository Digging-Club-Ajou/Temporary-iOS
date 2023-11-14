//
//  UploadStubService.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class UploadStubService: UploadServiceProtocol {
    func findMusic(with: String) async throws -> MusicResponse {
        .stub()
    }
    
    func verifyAlbumExistence() async throws -> AlbumExistenceResponse {
        .stub()
    }
    
    func searchLocation(query: String, x: String, y: String) async throws -> SearchLocationResponse {
        .stub()
    }
    
    func postMelodyAlbum(request: PostAlbumRequest) async throws {
        
    }
    
    func postMelodyCard(request: PostMelodayCardRequest) async throws {
        
    }
    
    func validateAlbumName(_ request: ValidateAlbumNameRequest) async throws -> StatusCodeResposne {
        .stub()
    }
    
    
}

//
//  UploadServiceProtocol.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

protocol UploadServiceProtocol {
    func findMusic(with: String) async throws -> MusicResponse
    func verifyAlbumExistence() async throws -> AlbumExistenceResponse
    func postMelodyAlbum(request: PostAlbumRequest) async throws
    func postMelodyCard(request: PostMelodayCardRequest) async throws
    func validateAlbumName(_ request: ValidateAlbumNameRequest) async throws -> StatusCodeResposne
    func searchLocation(query: String, x: String, y: String) async throws -> SearchLocationResponse
}

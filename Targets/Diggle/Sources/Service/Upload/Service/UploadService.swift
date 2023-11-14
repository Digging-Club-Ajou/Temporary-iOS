//
//  UploadService.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Alamofire
import Foundation

final class UploadService: UploadServiceProtocol {    
    private init() { }
    
    func findMusic(with: String) async throws -> MusicResponse {
        let url = "\(baseURL)/api/musics?search=\(with)"
        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { throw ServiceError.urlEncode }

        let header = try RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(encodedURL,
                                      method: .get,
                                      headers: header)
            .serializingDecodable(MusicResponse.self)
            .result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            throw failure
        }

    }
    
    func verifyAlbumExistence() async throws -> AlbumExistenceResponse {
        let url = "\(baseURL)/api/albums-validation"
        let header = try RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                      method: .post,
                                      headers: header)
            .serializingDecodable(AlbumExistenceResponse.self)
            .result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            throw failure
        }

    }
    
    func searchLocation(query: String, x: String, y: String) async throws -> SearchLocationResponse {
        let url = "\(baseURL)/api/location?query=\(query)&x=\(x)&y=\(y)"
        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { throw ServiceError.urlEncode }
        
        let header = try RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(encodedURL,
                                      method: .get,
                                      headers: header)
            .serializingDecodable(SearchLocationResponse.self).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            throw failure
        }
    }
    
    
    static let shared = UploadService()
    
    func validateAlbumName(_ request: ValidateAlbumNameRequest) async throws -> StatusCodeResposne {
        let url = "\(baseURL)/api/albums/name-validation"
        let header = try RequestHeaderProvider.shared.accessToken()
        let result = await AF.request(url,
                                      method: .post,
                                      parameters: request,
                                      encoder: JSONParameterEncoder.default,
                                      headers: header)
            .serializingDecodable(StatusCodeResposne.self).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            throw failure
        }
    }
    
    func postMelodyAlbum(request: PostAlbumRequest) async throws {
        let url = "\(baseURL)/api/albums"
        let header = try RequestHeaderProvider.shared.accessToken()
        
        var response = await AF.upload(multipartFormData: { data in
            data.append(request.imageData,
                        withName: "albumImage",
                        fileName: request.albumName,
                        mimeType: "image/jpeg")
            
            data.append(Data(request.albumName.utf8),
                        withName: "albumNameRequest")
        }, to: url, method: .post, headers: header)
            .serializingDecodable(ServerError.self)
            .response
        
        debugPrint(response.result)
        
        let serverError = response.data.flatMap {
            try? JSONDecoder().decode(ServerError.self, from: $0)
        }
        
        debugPrint(serverError)
        
        guard let serverError = serverError else { throw ServiceError.decode }
        
        throw serverError
    }
    
    func postMelodyCard(request: PostMelodayCardRequest) async throws {
        let url = "\(baseURL)/api/melody-cards"
        let header = try RequestHeaderProvider.shared.accessToken()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: request.melodyCardRequest)
            
            var response = await AF.upload(multipartFormData: { data in
                data.append(request.melodyImage,
                            withName: "melodyImage",
                            fileName: UUID().uuidString,
                            mimeType: "image/jpeg")
                
                data.append(jsonData,
                            withName: "melodyCardRequest",
                            fileName: UUID().uuidString,
                            mimeType: "application/json")
                
            }, to: url, method: .post, headers: header)
                .serializingDecodable(String.self)
                .response
            
            let serverError = response.data.flatMap {
                try? JSONDecoder().decode(ServerError.self, from: $0)
            }
            
            guard let serverError = serverError else { throw ServiceError.decode }
            
            throw serverError
        } catch {
            throw error
        }
    }
}

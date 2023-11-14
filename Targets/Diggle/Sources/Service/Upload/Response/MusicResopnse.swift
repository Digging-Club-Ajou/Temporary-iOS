//
//  MusicRequest.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct MusicResponse: Decodable {
    let spotifySearchDtos: [SpotifySearchDto]
    
    static func stub() -> MusicResponse {
        MusicResponse(spotifySearchDtos: [.stub(), .stub()])
    }
}

// MARK: - SpotifySearchDto
struct SpotifySearchDto: Decodable {
    let artistName, songTitle: String
    let imageURL, previewURL: String
    
    static func stub() -> SpotifySearchDto {
        SpotifySearchDto(artistName: "artistName",
                         songTitle: "songTitle",
                         imageURL: "https://picsum.photos/200/300",
                         previewURL: "https://picsum.photos/200/300")
    }

    enum CodingKeys: String, CodingKey {
        case artistName, songTitle
        case imageURL = "imageUrl"
        case previewURL = "previewUrl"
    }
}

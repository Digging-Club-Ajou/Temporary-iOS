//
//  SongCellModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct SongCellModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let imageURL: String
    let title: String
    let singer: String
    let genre: String = "genre"
    
    static func mock() -> SongCellModel {
        SongCellModel(imageURL:
                        "https://picsum.photos/200/300",
                      title: "Super Shy",
                      singer: "New Jeans")
    }
}

extension SongCellModel {
    init(dto: SpotifySearchDto) {
        imageURL = dto.imageURL
        title = dto.songTitle
        singer = dto.artistName
    }
}

//
//  PostMelodyCardRequest.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct PostMelodayCardRequest: Encodable {
    let melodyCardRequest: Information
    let melodyImage: Data
}

extension PostMelodayCardRequest {
    struct Information: Encodable {
        let artistName: String
        let songTitle: String
        let genre: String
        let previewUrl: String
        let address: String
        let cardDescription: String
        let color: String
        let albumCoverImageURL: String
    }
}

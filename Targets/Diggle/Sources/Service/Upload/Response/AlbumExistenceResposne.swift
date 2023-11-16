//
//  AlbumExistenceResposne.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct AlbumExistenceResponse: Decodable {
    let alreadyExist: Bool
    
    static func stub() -> AlbumExistenceResponse {
        .init(alreadyExist: true)
    }
}

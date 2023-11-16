//
//  UserInfoResponse.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/13.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct UserInfoResponse: Decodable {
    let memberID, albumID: Int

    enum CodingKeys: String, CodingKey {
        case memberID = "memberId"
        case albumID = "albumId"
    }
    
    static func stub() -> UserInfoResponse {
        UserInfoResponse(memberID: 1, albumID: 1)
    }
}

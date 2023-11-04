//
//  PostNicknameResponse.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/04.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct PostNicknameResponse: Decodable {
    let statusCode, message: String
    
    static func stub() -> PostNicknameResponse {
        return PostNicknameResponse(statusCode: "200",
                                    message: "사용 가능한 닉네임입니다.")
    }
}

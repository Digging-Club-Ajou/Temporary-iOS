//
//  KakaoLoginResponse.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct KakaoLoginResposne: Decodable {
    let accessToken, refreshToken: String
}

//
//  RequestHeaderProvider.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/04.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Alamofire

final class RequestHeaderProvider {
    static let shared = RequestHeaderProvider()
    
    func accessToken() throws -> HTTPHeaders {
        let accessToken = try DataManager.shared.getAccessToken()
        return ["AccessToken": accessToken]
    }
}

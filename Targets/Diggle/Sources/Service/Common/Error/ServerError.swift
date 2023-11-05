//
//  Server.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct ServerError: Error, Decodable {
    let statusCode: String
    let message: String
}

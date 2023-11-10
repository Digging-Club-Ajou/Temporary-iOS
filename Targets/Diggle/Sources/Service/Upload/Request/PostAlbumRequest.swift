//
//  PostAlbumRequest.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/05.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct PostAlbumRequest: Encodable {
    let albumName: String
    let imageData: Data
}

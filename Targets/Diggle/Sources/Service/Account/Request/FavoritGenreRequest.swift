//
//  FavoritGenreRequest.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/04.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct FavoriteGenereRequest: Encodable {
    var ballade = false
    var dance = false
    var rockMetal = false
    var rbAndSoul = false
    var rapHiphop = false
    var folkBlues = false
    var indie = false
    var pop = false
    var ostAndMusical = false
}

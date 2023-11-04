//
//  FavoriteGenreModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct FavoriteGenreModel {
    var genres: [FavoriteGenreCellModel] = FavoriteGenreCellModel.favoriteGenres()
    
    var isSectionEnabled: Bool {
        var count = 0
        for genre in genres {
            if genre.isSelected {
                count += 1
            }
        }
        
        return count < maxCount
    }
    
    var selectedCount: Int {
        var count = 0
        for genre in genres {
            if genre.isSelected {
                count += 1
            }
        }
        
        return count
    }

    var buttonForegroundColor: Color {
        isSectionEnabled ? .gray : .digglePink
    }
    
    var buttonText: String {
        var count = 0
        for genre in genres {
            if genre.isSelected {
                count += 1
            }
        }
        
        return "다음 \(count)/\(maxCount)"
    }
    
    private var maxCount: Int {
        5
    }
    
    var favoriteGenreRequest: FavoriteGenereRequest {
        var request = FavoriteGenereRequest()
        request.indie = genres[0].isSelected
        request.ballade = genres[1].isSelected
        request.dance = genres[2].isSelected
        request.rockMetal = genres[3].isSelected
        request.rbAndSoul = genres[4].isSelected
        request.rapHiphop = genres[5].isSelected
        request.folkBlues = genres[6].isSelected
        request.pop = genres[7].isSelected
        request.ostAndMusical = genres[8].isSelected
        return request
    }
}

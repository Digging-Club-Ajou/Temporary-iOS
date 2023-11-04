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
    
    var maxCount: Int {
        5
    }
}

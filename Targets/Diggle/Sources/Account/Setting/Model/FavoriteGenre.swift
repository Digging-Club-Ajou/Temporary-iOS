//
//  GenreModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import SwiftUI
import IdentifiedCollections

struct FavoriteGenre: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let imageSource: String
    let text: String
    var isSelected: Bool = false
    
    var opacity: CGFloat {
        isSelected ? 0.7 : 1 
    }
    
    var isOverlayViewPresented: Bool {
        isSelected
    }
    
    static let genres: IdentifiedArrayOf<Self> = [
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르1"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르2"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르3"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르4"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르5"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르6"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르7"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르8"),
        FavoriteGenre(imageSource: DiggleImage.genre.rawValue, text: "장르9"),
    ]
}

extension IdentifiedArray where Element == FavoriteGenre {
    var maxCount: Int {
        5 
    }
    
    var isSectionEnabled: Bool {
        var count = 0
        for genre in self {
            if genre.isSelected {
                count += 1
            }
        }
        
        return count < maxCount
    }
    
    var selectedCount: Int {
        var count = 0
        for genre in self {
            if genre.isSelected {
                count += 1
            }
        }
        
        return count
    }

    var buttonText: String {
        var count = 0
        for genre in self {
            if genre.isSelected {
                count += 1
            }
        }
        
        return "다음 \(count)/\(maxCount)"
    }
    
    var buttonForegroundColor: Color {
        isSectionEnabled ? .gray : .digglePink
    }
}

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

struct FavoriteGenreCellModel: Identifiable, Equatable {
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
    
    static func favoriteGenres() -> [FavoriteGenreCellModel] {
        [
            .init(imageSource: Image.Genre.indy.rawValue,
                  text: "인디"),
            .init(imageSource: Image.Genre.ballad.rawValue,
                  text: "발라드"),
            .init(imageSource: Image.Genre.dance.rawValue,
                  text: "댄스"),
            
            .init(imageSource: Image.Genre.metal.rawValue,
                  text: "록/메탈"),
            .init(imageSource: Image.Genre.rb_and_soul.rawValue,
                  text: "R&B/Soul"),
            .init(imageSource: Image.Genre.hiphop_and_rap.rawValue,
                  text: "힙합/랩"),
            
            .init(imageSource: Image.Genre.fork_and_blues.rawValue,
                  text: "포크/블루스"),
            .init(imageSource: Image.Genre.pop.rawValue,
                  text: "POP"),
            .init(imageSource: Image.Genre.ost_and_musical.rawValue,
                  text: "OST/뮤지컬"),
        ]
    }
}

//
//  FavoriteArtistModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct ArtistModel {
    var indyGroupArtists: [ArtistCellModel] = ArtistCellModel.indyGroupArtists()
    var indySoloArtists: [ArtistCellModel] = ArtistCellModel.indySoloArtists()
    
    var girlGroupArtists: [ArtistCellModel] = ArtistCellModel.girlGroupArtists()
    var girlSoloArtists: [ArtistCellModel] = ArtistCellModel.girlSoloArtists()
    
    var boyGroupArtists: [ArtistCellModel] = ArtistCellModel.boyGroupArtists()
    var boySoloArtists: [ArtistCellModel] = ArtistCellModel.girlSoloArtists()
    
    var foreignManArtistst: [ArtistCellModel] = ArtistCellModel.foreginManArtists()
    var foreignWoanArtistst: [ArtistCellModel] = ArtistCellModel.foreginWomanArtists()
    
    private var allArtists: [ArtistCellModel] {
        var artists: [ArtistCellModel] = []
        artists.append(contentsOf: indySoloArtists)
        artists.append(contentsOf: indyGroupArtists)
        artists.append(contentsOf: boySoloArtists)
        artists.append(contentsOf: boyGroupArtists)
        artists.append(contentsOf: girlSoloArtists)
        artists.append(contentsOf: girlGroupArtists)
        artists.append(contentsOf: foreignManArtistst)
        artists.append(contentsOf: foreignWoanArtistst)
        return artists
    }
    
    var selectedCount: Int {
        var count: Int = 0
        for artist in allArtists {
            if artist.isSelected {
                count += 1
            }
        }
        return count
    }
    
    var isArtistCellDisabeld: Bool {
        isSelectionLimitReached
    }
    
    var isNextScreenDisabled: Bool {
        !isSelectionLimitReached
    }
    
    private var isSelectionLimitReached: Bool {
        selectedCount == maxCount
    }
    
    var buttonForegroundColor: Color {
        isNextScreenDisabled ? .gray : .digglePink
    }
    
    var buttonText: String {
        return "다음 \(selectedCount)/\(maxCount)"
    }
    
    private var maxCount: Int {
        5
    }
    
    var favoriteArtistRequest: FavoriteArtistRequest {
        var selectedArtists: [String] = []
        for artist in allArtists {
            if artist.isSelected {
                selectedArtists.append(artist.text)
            }
        }
        return FavoriteArtistRequest(artistNames: selectedArtists)
    }
}

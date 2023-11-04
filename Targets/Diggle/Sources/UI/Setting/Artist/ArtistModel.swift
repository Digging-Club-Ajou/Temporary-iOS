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
    
    var selectedCount: Int {
        var count: Int = 0
        for indySoloArtist in indySoloArtists {
            if indySoloArtist.isSelected {
                count += 1
            }
        }
        
        for indyGroupArtist in indyGroupArtists {
            if indyGroupArtist.isSelected {
                count += 1
            }
        }
        
        for girlGroupArtist in girlGroupArtists {
            if girlGroupArtist.isSelected {
                count += 1
            }
        }
        
        for girlSoloArtist in girlSoloArtists {
            if girlSoloArtist.isSelected {
                count += 1
            }
        }
        
        for boySoloArtist in boySoloArtists {
            if boySoloArtist.isSelected {
                count += 1
            }
        }
        
        for boyGroupArtist in boyGroupArtists {
            if boyGroupArtist.isSelected {
                count += 1
            }
        }
        
        for man in foreignManArtistst {
            if man.isSelected {
                count += 1
            }
        }
        
        for woman in foreignWoanArtistst {
            if woman.isSelected {
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
}

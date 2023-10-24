//
//  SongCellViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

protocol SongCellViewModel: ObservableObject {
    func onSongTapped(_ song: SongCellModel) 
}

final class NullSongCellViewModel: SongCellViewModel {
    func onSongTapped(_ song: SongCellModel) {
        
    }
}

//
//  MusicSelectionModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct MusicSelectionModel {
    
    var focusField: FocusField?
    
    var isViewInformationPresented: Bool = true 
    
    var isSearchEndButtonPresented: Bool {
        focusField != nil
    }
    
    var isSearchTextPresented: Bool {
        state == .searchEnded
    }
    
    var searchText: String = ""
    var songs: [SongCellModel] = [] 
    var state: State = .searchTextEditing
}

extension MusicSelectionModel {
    enum State {
        case searchTextEditing
        case searchEnded
    }
}

extension MusicSelectionModel {
    enum FocusField: Hashable {
        case searchText
    }
}

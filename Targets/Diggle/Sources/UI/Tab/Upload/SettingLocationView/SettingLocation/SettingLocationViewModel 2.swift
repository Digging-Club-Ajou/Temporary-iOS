//
//  SettingLocationViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

final class SettingLocationViewModel {
    @Published var model = SettingLocationModel()
}

extension SettingLocationViewModel: LocationCellViewModel {
    func onLocationCellTapped(_ location: LocationCellModel) {
        
    }
}

extension SettingLocationViewModel: SearchViewModel {
    var textBinding: Binding<String> {
        .init {
            self.model.text
        } set: {
            self.model.isFindWithCurrentLocationButtonPresented = false
            self.model.text = $0
        }

    }
    
    var searchModel: SearchModel {
        model
    }
    
    func onSearchEndButtonTapped() {
        
    }
    
    func onSearchSubmit() {
        
    }
}

//
//  SearchViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

protocol SearchViewModel: ObservableObject {
    var searchModel: SearchModel { get }
    func onSearchEndButtonTapped()
    func onSearchSubmit() 
    var textBinding: Binding<String> { get }
}

final class NullSearchViewModel: SearchViewModel {
    func onSearchSubmit() {
        
    }
    
    @Published var searchModel: SearchModel = DefaultSearchModel()
    
    func onSearchEndButtonTapped() {
        
    }
    
    var textBinding: Binding<String> {
        .init {
            self.searchModel.text
        } set: {
            self.searchModel.text = $0
        }
    }
}

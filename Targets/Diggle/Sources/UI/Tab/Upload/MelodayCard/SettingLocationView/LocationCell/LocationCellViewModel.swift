//
//  LocationCellViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

protocol LocationCellViewModel: ObservableObject {
    func onLocationCellTapped(_ location: LocationCellModel)
}

final class NullLocationCellViewModel: LocationCellViewModel {
    func onLocationCellTapped(_ location: LocationCellModel) {
        
    }
}

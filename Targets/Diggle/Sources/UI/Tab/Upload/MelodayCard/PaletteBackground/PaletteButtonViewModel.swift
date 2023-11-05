//
//  PaletteButtonViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/19.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

protocol PaletteButtonViewModel: ObservableObject {
    func onColorTapped(_ color: Color)
}

final class NullPaletteButtonViewModel: PaletteButtonViewModel {
    func onColorTapped(_ color: Color) {
        
    }
}

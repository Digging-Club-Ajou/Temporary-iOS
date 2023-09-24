//
//  FecitFont.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import SwiftUI

enum DiggleFont {
    case re14
    case re18
    case bo18
    
    var font: Font {
        switch self {
        case .re14:
            return Font.system(size: 14)
        case .re18:
            return Font.system(size: 18)
        case .bo18:
            return Font.system(size: 18, weight: .bold)
        }
    }
}

extension View {
    
    @ViewBuilder
    func font(_ fecitFont: DiggleFont) -> some View {
        self
            .font(fecitFont.font)
    }
}

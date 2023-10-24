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
    case bo14
    case bo18
    case bo20
    case bo24
    case re12
    case re14
    case re18
    case re24
    
    var font: Font {
        switch self {
        case .bo14:
            return Font.system(size: 18, weight: .bold)
        case .bo18:
            return Font.system(size: 18, weight: .bold)
        case .bo20:
            return Font.system(size: 20, weight: .bold)
        case .bo24:
            return Font.system(size: 24, weight: .bold)
        case .re12:
            return Font.system(size: 12)
        case .re14:
            return Font.system(size: 14)
        case .re18:
            return Font.system(size: 18)
        case .re24:
            return Font.system(size: 24)
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

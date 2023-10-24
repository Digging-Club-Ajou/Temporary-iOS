//
//  ButtonStyles.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import SwiftUI

struct TextOverlayStyle: ButtonStyle {
    
    let text: String
    let font: DiggleFont = .bo18
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                Text(text)
                    .font(font.font)
            }
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

//
//  MelodyCardBackgroundModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct MelodyCardBackgroundModel: Hashable {
    var color: Color
    var rgb: String
    var opacity: Double = 1
    
    var presentColor: Color {
        color.opacity(opacity)
    }
}

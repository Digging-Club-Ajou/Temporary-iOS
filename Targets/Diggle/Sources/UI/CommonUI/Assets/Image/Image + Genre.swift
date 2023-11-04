//
//  Image + Genre.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Genre: String {
        case ballad
        case dance
        case fork_and_blues
        case hiphop_and_rap
        case indy
        case metal
        case ost_and_musical
        case pop
        case rb_and_soul
        
        var image: Image {
            Image(self.rawValue)
        }
    }
}

//
//  Image + Artist.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Artist {
        case blackpink
        
        var image: Image {
            switch self {
            case .blackpink:
                return Image("blackpink")
            }
        }
    }
}

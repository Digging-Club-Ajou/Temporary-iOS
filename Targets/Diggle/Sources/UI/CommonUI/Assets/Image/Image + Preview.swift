//
//  Image + Preview.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Preview {
        case jenny
        
        var image: Image {
            switch self {
            case .jenny:
                return Image("jenny")
            }
        }
    }
}

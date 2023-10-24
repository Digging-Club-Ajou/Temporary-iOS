//
//  Image + Diggle.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Diggle {
        case logo
        case loveLee
        
        var image: Image {
            switch self {
            case .logo:
                return Image("diggleLogo")
            case .loveLee:
                return Image("loveLee")
            }
        }
    }
}

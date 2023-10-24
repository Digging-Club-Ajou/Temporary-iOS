//
//  Image + Photo.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Photo {
        case camera
        case gallery
        case palette
        
        var image: Image {
            switch self {
            case .camera:
                return Image("camera_off")
            case .gallery:
                return Image("gallery")
            case .palette:
                return Image("palette")
            }
        }
    }
}

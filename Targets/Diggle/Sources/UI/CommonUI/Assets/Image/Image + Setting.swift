//
//  Image + Setting.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/01.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//


import SwiftUI

extension Image {
    enum Setting {
        case settingComplete
        
        var image: Image {
            switch self {
            case .settingComplete:
                return Image("settingComplete")
            }
        }
    }
}

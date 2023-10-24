//
//  Image + Extension.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Image {
    enum Tab {
        case unselectedHome
        case selectedHome
        case unselectedUpload
        case selectedUpload
        case unselectedProfile
        case selectedProfile
        
        var image: Image {
            switch self {
            case .unselectedHome:
                return Image("home_unselected")
            case .selectedHome:
                return Image("home_selected")
            case .unselectedUpload:
                return Image("upload_unselected")
            case .selectedUpload:
                return Image("upload_selected")
            case .unselectedProfile:
                return Image("profile_unselected")
            case .selectedProfile:
                return Image("profile_selected")
            }
        }
    }
}

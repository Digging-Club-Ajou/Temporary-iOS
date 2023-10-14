//
//  DiggleTabModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import SwiftUI

enum DiggleTabModel: Hashable {
    case home
    case upload
    case profile
    
    func image(_ selection: DiggleTabModel) -> Image {
        switch self {
        case .home:
            if self == selection {
                return Image.Tab.selectedHome.image
            } else {
                return Image.Tab.unselectedHome.image
            }
        case .upload:
            if self == selection {
                return Image.Tab.selectedUpload.image
            } else {
                return Image.Tab.unselectedUpload.image
            }
        case .profile:
            if self == selection {
                return Image.Tab.selectedProfile.image
            } else {
                return Image.Tab.unselectedProfile.image
            }
        }
    }
}

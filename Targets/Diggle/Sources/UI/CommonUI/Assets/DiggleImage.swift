//
//  DiggleImage.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import SwiftUI

enum DiggleImage: String {
    case genre
    case location
    case border_camera
    case xmark
    case exclamation_red
    case check_blue
}

extension Image {
    init(_ diggleImage: DiggleImage) {
        self.init(diggleImage.rawValue)
    }
}

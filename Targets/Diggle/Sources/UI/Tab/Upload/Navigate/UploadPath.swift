//
//  UploadPath.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

enum UploadPath: Hashable {
    case album(Data)
    case card
    case searchMusic
    case preview(MelodyCardModel, SettingLocationModel)
    case location(MelodyCardModel)
}

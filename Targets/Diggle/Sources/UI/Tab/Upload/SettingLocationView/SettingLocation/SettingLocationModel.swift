//
//  SettingLocationModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct SettingLocationModel: SearchModel {
    var placeholder: String = "장소 검색"
    
    var text: String = ""
    
    var isSearchEndButtonPreseneted: Bool = false
    
    var isFindWithCurrentLocationButtonPresented: Bool = true
    
    var locations: [LocationCellModel] = [] 
}

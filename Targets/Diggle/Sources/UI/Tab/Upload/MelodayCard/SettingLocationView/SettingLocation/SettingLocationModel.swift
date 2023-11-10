//
//  SettingLocationModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct SettingLocationModel: SearchModel, Hashable {
    var placeholder: String = "장소 검색"
    
    var text: String = ""
    
    var isSearchEndButtonPreseneted: Bool = false
    
    // nil은 아직 위치가 선택되지 않은 상태입니다.
    var selectedLocation: LocationCellModel?
    
    var isFindWithCurrentLocationButtonPresented: Bool = true
    
    var locations: [LocationCellModel] = []
    
    var latitude: String = "" 
    var longitue: String = ""
}

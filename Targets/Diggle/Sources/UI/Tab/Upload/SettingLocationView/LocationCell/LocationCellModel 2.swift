//
//  LocationCellModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct LocationCellModel: Identifiable {
    let id: String = UUID().uuidString
    let locationText: String
    let distance: Double
    
    var distanceText: String {
        "\(distance)km"
    }
    
    static func mock() -> LocationCellModel {
        LocationCellModel(locationText: "아주대학교", distance: 1.2)
    }
    
    static func mocks() -> [LocationCellModel] {
        [
            LocationCellModel(locationText: "아주대학교 율곡관", distance: 1.2),
            LocationCellModel(locationText: "스타벅스 아주대점", distance: 1.8),
            LocationCellModel(locationText: "지지고 아주대점", distance: 2.2)
        ]
    }
}

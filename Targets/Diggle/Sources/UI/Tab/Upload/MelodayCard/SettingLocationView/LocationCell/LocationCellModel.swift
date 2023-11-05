//
//  LocationCellModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

struct LocationCellModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let locationText: String
    let distanceText: String
    
    static func mock() -> LocationCellModel {
        LocationCellModel(locationText: "아주대학교", distanceText: "1.2km")
    }
    
    static func mocks() -> [LocationCellModel] {
        [
            LocationCellModel(locationText: "아주대학교 율곡관", distanceText: "1.2km"),
            LocationCellModel(locationText: "스타벅스 아주대점", distanceText: "1.8km"),
            LocationCellModel(locationText: "지지고 아주대점", distanceText: "2.2km")
        ]
    }
}

extension LocationCellModel {
    init(locationResponse: LocationResponse) {
        self.init(locationText: locationResponse.placeName,
                  distanceText: locationResponse.distance)
    }
}

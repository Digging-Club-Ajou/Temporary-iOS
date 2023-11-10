//
//  SearchLocationReseponse.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/07.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation


struct SearchLocationResponse: Decodable {
    let locationResponses: [LocationResponse]
    
    static func stub() -> SearchLocationResponse {
        SearchLocationResponse(locationResponses: [.stub(), .stub()])
    }
}

// MARK: - LocationResponse
struct LocationResponse: Decodable {
    let placeName, distance: String
    
    static func stub() -> LocationResponse {
        .init(placeName: "아주대", distance: "1.3km")
    }
}

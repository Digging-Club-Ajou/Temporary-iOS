//
//  SearchModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

protocol SearchModel: Hashable {
    var placeholder: String { get set }
    var text: String { get set }
    var isSearchEndButtonPreseneted: Bool { get set }
}

struct DefaultSearchModel: SearchModel {
    var placeholder: String = "placeholder"
    
    var text: String = ""
    
    var isSearchEndButtonPreseneted: Bool = false
}

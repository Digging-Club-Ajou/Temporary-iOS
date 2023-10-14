//
//  Color + Identifiable.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/19.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension Color: Identifiable {
    public var id: String {
        UUID().uuidString
    }
}

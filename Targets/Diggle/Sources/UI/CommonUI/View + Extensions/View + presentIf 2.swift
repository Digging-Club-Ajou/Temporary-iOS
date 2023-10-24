//
//  View + presentIf.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func presentIf(_ condition: Bool) -> some View {
        if condition {
            self
        }
    }
}

//
//  FecitShape.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct DiggleShape {
    static let roundedRectangle: some View =
    RoundedRectangle(cornerRadius: 10)
        .aspectRatio(CGSize(width: 6.178, height: 1), contentMode: .fit)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
    
}

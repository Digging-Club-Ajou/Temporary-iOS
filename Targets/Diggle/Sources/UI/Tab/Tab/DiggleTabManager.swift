//
//  DiggleTabViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

final class DiggleTabManager: ObservableObject {
    static let shared = DiggleTabManager()
    
    @Published var selection: DiggleTabModel = .home
    
    func onTabTapped(_ tab: DiggleTabModel) {
        selection = tab
    }
}

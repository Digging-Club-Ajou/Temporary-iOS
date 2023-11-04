//
//  AccountNavigateManager.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class AccountNavigateManager: ObservableObject {
    @Published private(set) var paths: [AccountPath] = []
    static let shared = AccountNavigateManager()
    
    func navigateTo(_ path: AccountPath) {
        paths.append(path)
    }
}

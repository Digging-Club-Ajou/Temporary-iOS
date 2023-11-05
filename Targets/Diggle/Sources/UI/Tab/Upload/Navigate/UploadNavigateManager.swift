//
//  NavigateUploadViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

final class UploadNavigateManager: ObservableObject {
    static let shared = UploadNavigateManager()
    
    @Published var paths: NavigationPath = .init()
    
    func navigateTo(_ path: UploadPath) {
        paths.append(path)
    }
    
    func popLast() {
        paths.removeLast()
    }
}

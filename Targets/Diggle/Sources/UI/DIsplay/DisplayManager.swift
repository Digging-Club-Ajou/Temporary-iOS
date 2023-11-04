//
//  DisplayManager.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/31.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class DisplayManager: ObservableObject {
    
    static let shared = DisplayManager()
    
    @Published private(set) var model: DisplayState = .setting
    
    func display(_ view: DisplayState) {
        model = view
    }
}

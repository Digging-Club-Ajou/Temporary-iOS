//
//  View + useCustomTabbar.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import SwiftUIIntrospect

extension View {
    @ViewBuilder
    func useCustomTabbar() -> some View {
        self
            .overlay(alignment: .bottom) {
                DiggleTabbarView()
            }
            .introspect(.tabView, on: .iOS(.v16)) { tabview in
                tabview.tabBar.isHidden = true
            }
    }
}

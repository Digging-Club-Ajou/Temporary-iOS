//
//  DisplayView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/31.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct DisplayView: View {
    
    @EnvironmentObject var displayManager: DisplayManager
    
    var body: some View {
        switch displayManager.model {
        case .login:
            AccountNavigateView()
        case .setting:
            SettingNavigateView()
        case .main:
            DiggleTabView()
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}

//
//  SettingNavigateView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SettingNavigateView: View {
    
    var body: some View {
        NavigationStack {
            FavoriteGenreView()
                .customTitle("")
        }
        .tint(.black)
    }
}

struct SettingNavigateView_Previews: PreviewProvider {
    static var previews: some View {
        SettingNavigateView()
    }
}

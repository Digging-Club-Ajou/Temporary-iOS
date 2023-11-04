//
//  AccountNavigateView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct AccountNavigateView: View {
    var body: some View {
        NavigationStack {
            LoginView()
                .navigationDestination(for: AccountPath.self) {
                    switch $0 {
                    case .artist:
                        EmptyView()
                    case .genres:
                        FavoriteGenreView()
                    case .kakaoWebView:
                        KakaoWebView()
                    }
                }
        }
    }
}

struct AccountNavigateView_Previews: PreviewProvider {
    static var previews: some View {
        AccountNavigateView()
    }
}

//
//  KakaoWebView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct KakaoWebView: View {
    
    @StateObject private var viewModel = kakaoWebViewModel()
    var body: some View {
        VStack {
            DiggleWebView(viewModel: viewModel)
                .onChange(of: viewModel.model.authCode) { newValue in
                    
                }
        }
    }
}

struct KakaoWebView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoWebView()
    }
}

//
//  LoginView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        
        VStack {
            LoginViewIndicator(currentPage: viewModel.model.informationState.rawValue)
                .animation(.spring(), value: viewModel.model.informationState)
                .padding(.top, 30)
            
            TabView(selection: viewModel.tabSelectionBinding) {
                ForEach(LoginInformationState.allCases) { state in
                    
                    VStack {
                        Image(state.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: state.width, height: state.height)
                        
                        Text(state.headerText)
                        
                        Text(state.text)
                            .multilineTextAlignment(.center)
                    }
                    .tag(state)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Button {
                viewModel.onKakaoLoginButtonTapped()
            } label: {
                Image("kakaoLoginMedium")
            }
            
            SignInWithAppleButton { request in
                debugPrint("request")
            } onCompletion: { result in
                debugPrint(result)
            }
            .frame(width: 300, height: 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

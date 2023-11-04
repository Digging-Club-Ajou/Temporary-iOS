//
//  SetNicknameView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/30.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SetNicknameView: View {
    
    @ObservedObject var viewModel: SettingViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("""
                    거의 다 왔어요!
                    닉네임을 설정해주세요
                    """)
            .font(.bo24)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                HStack {
                    Text("@")
                    TextField("guide_example",
                              text: $viewModel.setNicknameModel.nickname)
                    .onChange(of: viewModel.setNicknameModel.nickname) { newValue in
                        viewModel.onChageOfNickname(newValue)
                    }

                    nickStateView(viewModel.setNicknameModel.nicknameState)
                    
                    Button {
                        viewModel.onSetNicknameViewXButtonTapped()
                    } label: {
                        Image(.xmark)
                    }
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 10)
                .background(
                    Rectangle().foregroundColor(.grayF4F4F4)
                )
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.digglePink)
                }
                
                Text(viewModel.setNicknameModel.nicknameGuideText)
                    .foregroundColor(viewModel.setNicknameModel.guideTextForegroundColor)
                    .font(.re12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            Spacer()
            
            NavigationLink {
                CompleteSettingView(viewModel: viewModel)
            } label: {
                DiggleShape.roundedRectangle(horizontalPadding: 0)
                    .foregroundColor(viewModel.setNicknameModel.completeButtonForgroundColor)
            }
            .buttonStyle(TextOverlayStyle(text: "다음"))
            .disabled(viewModel.setNicknameModel.isCompleteButtonDisable)
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .customTitle("")
        .onAppear {
            viewModel.onSetNicknameViewAppear()
        }
        .onDisappear {
            viewModel.onSetNicknameViewOnDisappear()
        }
    }
    
    @ViewBuilder
    private func nickStateView(_ state: SetNicknameModel.NicknameState) -> some View {
        switch state {
        case .empty:
            EmptyView()
        case .enable:
            Image(.check_blue)
        case .disable:
            Image(.exclamation_red)
        }
    }
}

struct SetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNicknameView(viewModel: SettingViewModel())
    }
}

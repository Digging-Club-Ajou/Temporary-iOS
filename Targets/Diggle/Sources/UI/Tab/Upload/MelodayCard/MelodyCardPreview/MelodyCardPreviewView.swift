//
//  MelodyCardPreviewView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/22.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct MelodyCardPreviewView: View {
    
    @EnvironmentObject var accountManager: AccountManager
    @StateObject private var viewModel: MelodyCardPreviewViewModel
    
    init(melodyCardModel: MelodyCardModel,
         settingLocationModel: SettingLocationModel) {
        let viewModel = MelodyCardPreviewViewModel(
            melodyCardModel: melodyCardModel,
            settingLocationModel: settingLocationModel
        )
        
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                MelodyCardView(isPreview: true,
                               model: $viewModel.melodyCardModel)
                .overlay(alignment: .topLeading) {
                    Text("@\(accountManager.name)")
                        .font(.re14)
                        .padding(.all)
                        .foregroundColor(.white)
                }
                .padding(.top, 30)
                
                Button {
                    viewModel.onMelodyCardPreviewCompleteButtonTapped()
                } label: {
                    Text("게시하기")
                        .font(.bo18)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(viewModel.melodyCardModel.background.color)
                        )
                }
                
            }
            .padding(.horizontal, 20)
        }
        .scrollDisabled(true)
        .customTitle("멜로디 카드 미리보기")
    }
}

struct MelodyCardPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MelodyCardPreviewView(
            melodyCardModel: .mock(),
            settingLocationModel: .init()
        )
    }
}

//
//  MelodyCardView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/19.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct MelodyCardView: View {
    
    private let isPreview: Bool
    var model: Binding<MelodyCardModel>
    
    init(isPreview: Bool = false, model: Binding<MelodyCardModel>) {
        self.isPreview = isPreview
        self.model = model
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            UnevenRoundendRectangle(radius: 20, corners: [.topLeft, .topRight])
                .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                .foregroundColor(model.wrappedValue.background.color)
                .overlay {
                    model.wrappedValue.image
                        .resizable()
                        .presentIf(model.wrappedValue.isImagePresented)
                        .clipShape(UnevenRoundendRectangle(radius: 20, corners: [.topLeft, .topRight]))
                }
                .overlay(alignment: .bottomTrailing) {
                    playButton()
                }
            
            Rectangle()
                .frame(height: 5)
                .foregroundColor(model.wrappedValue.background.presentColor)
            
            info()
            
            TextField("탭하여 함께 전하고 싶은 메시지를 작성해보세요!\n어떤 추억을 공유하는 음악인가요? :)", text: model.text)
                .font(.re12)
                .foregroundColor(.gray999999)
                .presentIf(isPreview)
                .padding(.leading)
                .tint(model.wrappedValue.background.color)
        }
        .padding(.bottom, 20)
        .background {
            Color.white
                .clipShape(UnevenRoundendRectangle(
                    radius: 20,
                    corners: [.allCorners])
                )
                .shadow(color: .gray, radius: 10, x: 10, y: 10)
        }
    }
    
    @ViewBuilder
    private func playButton() -> some View {
        Image(systemName: "pause.circle.fill")
            .resizable()
            .frame(width: 40, height: 40)
            .presentIf(isPreview)
            .foregroundColor(model.wrappedValue.background.color)
            .background {
                Color.white
                    .clipShape(Circle())
                    .presentIf(isPreview)
            }
            .padding(.all)
    }
    
    @ViewBuilder
    private func info() -> some View {
        HStack {
            VStack {
                Text(model.wrappedValue.songCellModel.title)
                    .font(.bo18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(model.wrappedValue.songCellModel.singer)
                    .font(.re12)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all)
            
            Image(systemName: "heart")
                .resizable()
                .frame(width: 24, height: 20)
                .padding(.trailing, 10)
                .presentIf(isPreview)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MelodyCardView_Previews: PreviewProvider {
    static var previews: some View {
        MelodyCardView(model: .constant(.mock()))
        MelodyCardView(isPreview: true, model: .constant(.previewMock()))
    }
}

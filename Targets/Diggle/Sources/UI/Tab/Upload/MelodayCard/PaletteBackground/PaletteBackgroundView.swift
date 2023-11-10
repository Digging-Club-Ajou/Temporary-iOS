//
//  PaletteBackgroundView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct PaletteBackgroundView: View {
    
    @ObservedObject var viewModel: UploadMelodyCardViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            MelodyCardView(model: $viewModel.melodyCardModel)
            
            PaletteButtonView(viewModel: viewModel)
            
            Slider(value: $viewModel.melodyCardModel.background.opacity)
                .tint(viewModel.melodyCardModel.background.color)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .customTitle("배경 색상 선택")
        .toolbar {
            Button {
                
            } label: {
                Text("완료")
                    .foregroundColor(.primary)
                    .font(.re14)
            }
        }
    }
}

struct PaletteBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaletteBackgroundView(viewModel: UploadMelodyCardViewModel())
        }
    }
}

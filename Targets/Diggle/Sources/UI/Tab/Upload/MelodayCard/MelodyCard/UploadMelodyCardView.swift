//
//  MelodyCardView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct UploadMelodyCardView: View {
    
    @StateObject private var viewModel = UploadMelodyCardViewModel()
    let spacing: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 10) {
            
            MelodyCardView(model: $viewModel.melodyCardModel)
            
            Spacer()
            
            HStack {
                
                Button {
                    viewModel.onMelodyCardSettingCameraButtonTapped()
                } label: {
                    Image.Photo.camera.image
                }

                Image.Photo.gallery.image
                
                NavigationLink {
                    PaletteBackgroundView(viewModel: viewModel)
                } label: {
                    Image.Photo.palette.image
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .customTitle("배경 사진 선택")
        .sheet(isPresented: $viewModel.melodyCardModel.isCameraViewPresented) {
            CameraView(
                captrueDelegate: viewModel,
                isPresented: $viewModel.melodyCardModel.isCameraViewPresented)
        }
        .onAppear {
            viewModel.onMelodyCardSettingOnAppear()
        }
    }
}

struct MelodyCardSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UploadMelodyCardView()
        }
    }
}

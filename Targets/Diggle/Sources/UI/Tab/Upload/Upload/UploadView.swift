//
//  UploadView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import PhotosUI
import SwiftUI

struct UploadView: View {
    
    @EnvironmentObject var accountManager: AccountManager
    @StateObject private var viewModel = UploadViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("반갑습니다. \(accountManager.name) 님!")
                    .font(.bo24)
                    .padding(.top, 50)
                
                Text("나만의 앨범을 만들어보세요.")
                    .font(.re24)
                
                
                GeometryReader { proxy in
                    HStack(spacing: 30) {
                        Image.Diggle.logo.image
                            .resizable()
                            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                            .frame(width: (proxy.size.width - 30) * 0.6)
                        
                        Image.Diggle.loveLee.image
                            .resizable()
                            .aspectRatio(CGSize(width: 1, height: 1.2), contentMode: .fit)
                            .frame(width: (proxy.size.width - 30) * 0.4)
                    }
                }
                .frame(height: 300)
                .padding(.top, 80)
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack {
                Button {
                    viewModel.onCameraButtonTapped()
                } label: {
                    Image.Photo.camera.image
                }
                Image.Photo.gallery.image
            }
            
            Spacer()
        }
        .customTitle("플레이리스트 앨범 만들기")
        .fullScreenCover(isPresented: $viewModel.isCameraViewPresented) {
            CameraView(captrueDelegate: viewModel,
                       isPresented: $viewModel.isCameraViewPresented)
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigateUploadView()
            .environmentObject(AccountManager.shared)
            .environmentObject(NavigateUploadManager.shared)
    }
}

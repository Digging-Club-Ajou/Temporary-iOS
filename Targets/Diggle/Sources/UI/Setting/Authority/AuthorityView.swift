//
//  AuthorityView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/30.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import AVFoundation
import CoreLocation
import ComposableArchitecture
import SwiftUI
import Photos

struct AuthorityView: View {
    
    @ObservedObject var viewModel: SettingViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("""
            편리한 디글 이용을 위해
            아래의 접근 권한 허용이 필요합니다.
            """)
            .font(.bo24)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            cameraAndGalleryInfo()
                .padding(.bottom, 30)
            
            locationInfo()
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("• 위 접근권한은 더 나은 서비스를 제공하기 위해 사용됩니다.")
                    .foregroundColor(.gray999999)
                    .font(.re12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• 허용하지 않으셔도 해당 기능 외의 서비스 이용은 가능합니다.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray999999)
                    .font(.re12)
            }
            .frame(maxWidth: .infinity)
            
            NavigationLink {
                SetNicknameView(viewModel: viewModel)
            } label: {
                DiggleShape.roundedRectangle(horizontalPadding: 0)
                    .foregroundColor(.digglePink)
                    .overlay {
                        Text("확인")
                            .font(.bo20)
                    }
            }
        }
        .frame(alignment: .top)
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.onAuthorityViewAppear()
        }
        .customTitle("")
    }
    
    @ViewBuilder
    private func cameraAndGalleryInfo() -> some View {
        HStack(alignment: .top, spacing: 20) {
            Image(.border_camera)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("카메라/사진")
                    Text("(선택)")
                        .foregroundColor(.gray999999)
                }
                
                Text("앱 내 ‘앨범’, ‘멜로디카드’ 등의 게시물 등록을 위해 사진 및 카메라 접근 권한이 필요합니다.")
                    .foregroundColor(.gray999999)
            }
        }
    }
    
    @ViewBuilder
    private func locationInfo() -> some View {
        
        HStack(alignment: .top, spacing: 20) {
            Image(.location)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("위치")
                    Text("(선택)")
                        .foregroundColor(.gray999999)
                }
                
                Text("앱 내 ‘앨범’ 및 ‘멜로디카드’ 등의 게시물 등록을 위해 위치 권한이 필요합니다.")
                    .foregroundColor(.gray999999)
            }
        }
    }
}

//struct AuthorityView_Previews: PreviewProvider {
//    static var previews: some View {
////        AuthorityView(store: Store(initialState: AuthorityFeature.State(), reducer: {
////            AuthorityFeature()
////        }))
//    }
//}

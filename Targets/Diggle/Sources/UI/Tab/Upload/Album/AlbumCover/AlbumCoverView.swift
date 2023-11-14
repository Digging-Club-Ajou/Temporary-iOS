//
//  AlbumCoverView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import SwiftUIIntrospect

struct AlbumCoverView: View {
    
    @StateObject private var viewModel: AlbumCoverViewModel
    @FocusState private var focusField: AlbumCoverModel.FocusField?
    
    init(data: Data) {
        _viewModel = StateObject(
            wrappedValue: AlbumCoverViewModel(data: data)
        )
    }
    
    /**
     미리 보기용으로 사용합니다.
     */
    init(image: Image) {
        _viewModel = StateObject(wrappedValue: AlbumCoverViewModel(image: image))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("앨범에 이름을 붙여볼까요?")
                    .font(.bo24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .presentIf(viewModel.model.isAlbumInformationPresented)
                    .padding(.vertical, 50)
                
                viewModel.model.image
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(alignment: .bottom) {
                        TextField("",
                                  text: $viewModel.model.albumTitle,
                                  prompt: Text("앨범의 이름을 입력해주세요.")
                            .foregroundColor(.white)
                        )
                        .focused($focusField, equals: .albumTitle)
                        .foregroundColor(.white)
                        .padding(.all)
                        .font(.bo24)
                        .presentIf(viewModel.model.isAlbumTitlePresented)
                    }
                
                Text("한글, 영문, 숫자를 포함한 15자를 지원합니다.")
                    .presentIf(viewModel.model.isAlbumTitleRestrictionInformationPresented)
                    .font(.re12)
                    .foregroundColor(.gray767676)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                bottomButtons()
                
                Spacer()
                    .presentIf(viewModel.model.isBottomSpacerPresented)
            }
            .animation(.spring(), value: viewModel.model.isAlbumInformationPresented)
            .animation(.spring(), value: viewModel.model.isBottomSpacerPresented)
            .customTitle(viewModel.model.title)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    completeButton()
                }
            }
        }
        .tint(.blue)
        .onChange(of: viewModel.model.focusField) { newValue in
            focusField = newValue
        }
        .onChange(of: focusField) { newValue in
            viewModel.model.focusField = newValue
        }
    }
    
    
    private func completeButton() -> some View {
         Button {
             viewModel.onAlbumCompleteButtonTapped()
        } label: {
            Text("완료")
                .font(.re14)
                .foregroundColor(.primary)
        }
        .presentIf(viewModel.model.isCompleteButtonPresented)
    }
    
    private func bottomButtons() -> some View {
        HStack {
            Button {
                viewModel.onTakeAgainButtonTapped()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(CGSize(width: 4, height: 1), contentMode: .fit)
                    .foregroundColor(.grayE9E9EA)
                    .overlay {
                        Text("다시 찍기")
                            .font(.bo18)
                            .foregroundColor(.black)
                    }
            }
            .presentIf(viewModel.model.isTakeAgainButtonPresented)
            .fullScreenCover(isPresented: $viewModel.isCamreraPresented) {
                CameraView(captrueDelegate: viewModel,
                           isPresented: $viewModel.isCamreraPresented)
            }
            
            Button {
                viewModel.onUsePhotoButtonTapped()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(CGSize(width: 4, height: 1), contentMode: .fit)
                    .foregroundColor(.grayE9E9EA)
                    .overlay {
                        Text("사용하기")
                            .font(.bo18)
                            .foregroundColor(.black)
                    }
            }
            .presentIf(viewModel.model.isUsePhotoButtonPresented)
        }
    }
}

struct AlbumCoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AlbumCoverView(image: Image.Preview.jenny.image)
        }
    }
}

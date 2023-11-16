//
//  MusicSelectionView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct MusicSelectionView: View {
    
    @StateObject private var viewModel = SearchMusicViewModel()
    @FocusState private var focusField: MusicSelectionModel.FocusField?
    
    var body: some View {
        ScrollView {
            VStack {
                Text("추억이 담긴 노래를 \n검색해보세요.")
                    .font(.bo24)
                    .presentIf(viewModel.musicSelectionModel.isViewInformationPresented)
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray767676)
                    
                    TextField("아티스트, 음악 검색", text: $viewModel.musicSelectionModel.searchText)
                        .focused($focusField, equals: .searchText)
                        .onSubmit {
                            viewModel.onMusicSelectionSubmit()
                        }
                        .overlay(alignment: .trailing) {
                            searchEndButton()
                        }
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.grayE9E9EA)
                )
                
                Text("'\(viewModel.musicSelectionModel.searchText)'")
                    .font(.bo24)
                    .presentIf(viewModel.musicSelectionModel.isSearchTextPresented)
                
                ForEach(viewModel.musicSelectionModel.songs) { song in
                    NavigationLink {
                        UploadMelodyCardView()
                    } label: {
                        SongCellLabelView(model: song)
                    }
                }
            }
            .padding(.all, 1)
            .padding(.horizontal, 10)
        }
        .animation(.spring(), value: viewModel.musicSelectionModel.isViewInformationPresented)
        .tint(.blue)
        .customTitle("노래 검색")
        .onChange(of: viewModel.musicSelectionModel.searchText, perform: { newValue in
            viewModel.onChageOfMusicSelectionSearchText(newValue)
        })
        .onChange(of: viewModel.musicSelectionModel.focusField) { newValue in
            focusField = newValue
            viewModel.onChageOfMusicSelectionFocusField()
        }
        .onChange(of: focusField) { newValue in
            viewModel.musicSelectionModel.focusField = newValue
        }
    }
    
    private func searchEndButton() -> some View {
        Button {
            viewModel.onMusicSelectionSearchEndButtonTapped()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray767676)
        }
        .presentIf(viewModel.musicSelectionModel.isSearchEndButtonPresented)
    }
}

struct MusicSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MusicSelectionView()
        }
    }
}

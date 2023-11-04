//
//  FavoriteGenreView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct FavoriteGenreView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    let imageColumns: [GridItem] = [GridItem(.flexible(), spacing: 15),
                                    GridItem(.flexible(), spacing: 15),
                                    GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10) {
                    Text("좋아하는 장르를 선택해주세요")
                        .font(DiggleFont.re18)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                    
                    Text("선택한 장르를 기반으로 맞춤형 플레이리스트를 제공합니다")
                        .font(DiggleFont.re14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    LazyVGrid(columns: imageColumns, spacing: 20) {
                        ForEach(viewModel.favoriteGenreModel.genres) { genre in
                            Button {
                                viewModel.onGenreCellTapped(genre)
                            } label: {
                                Image(genre.imageSource)
                                    .resizable()
                                    .aspectRatio(CGSize(width: 1, height: 1),
                                                 contentMode: .fit)
                                    .clipShape(Circle())
                                    .opacity(genre.opacity)
                                    .overlay {
                                        Text("\(genre.text)")
                                            .font(.re14)
                                            .foregroundColor(.white)
                                    }
                            }
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.digglePink)
                                    .presentIf(genre.isOverlayViewPresented)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .presentIf(genre.isOverlayViewPresented)
                                    .foregroundColor(.digglePink)
                                    .background(Color.white.clipShape(Circle()))
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal)
            }
            
            NavigationLink {
                FavoriteArtistsView(viewModel: viewModel)
            } label: {
                DiggleShape.roundedRectangle()
                    .foregroundColor(viewModel.favoriteGenreModel.buttonForegroundColor)
                    .overlay {
                        Text(viewModel.favoriteGenreModel.buttonText)
                            .font(.bo20)
                    }
            }
        }
        .customTitle("")
    }
}

struct FavoriteGenreView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGenreView()
    }
}

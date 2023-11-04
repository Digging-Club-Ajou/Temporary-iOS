//
//  FavoriteArtistsVIew.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FavoriteArtistsView: View {
    
    @ObservedObject var viewModel: SettingViewModel
    let imageColumns: [GridItem] = [GridItem(.flexible(), spacing: 15),
                                    GridItem(.flexible(), spacing: 15),
                                    GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Text("좋아하는 장르를 선택해주세요")
                .font(DiggleFont.re18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 50)
            
            Text("선택한 장르를 기반으로 맞춤형 플레이리스트를 제공합니다")
                .font(DiggleFont.re14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    section(title: "인디 솔로", category: \.indySoloArtists)
                    section(title: "인디 그룹", category: \.indyGroupArtists)
                    section(title: "여자 솔로", category: \.girlSoloArtists)
                    section(title: "여자 그룹", category: \.girlGroupArtists)
                    section(title: "남자 솔로", category: \.boySoloArtists)
                    section(title: "남자 그룹", category: \.boyGroupArtists)
                    section(title: "해외 여자", category: \.foreignWoanArtistst)
                    section(title: "해외 남자", category: \.foreignManArtistst)
                }
            }
            
            NavigationLink {
                AuthorityView(viewModel: viewModel)
            } label: {
                DiggleShape.roundedRectangle()
                    .foregroundColor(viewModel.favoriteArtistsModel.buttonForegroundColor)
                    .overlay {
                        Text(viewModel.favoriteArtistsModel.buttonText)
                            .font(.bo20)
                    }
            }
            .disabled(viewModel.favoriteArtistsModel.isNextScreenDisabled)
        }
        .customTitle("")
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func section(title: String,
                         category: WritableKeyPath<ArtistModel, [ArtistCellModel]>) -> some View {
        VStack {
            Text(title)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .foregroundColor(Color.digglePink)
                )
            
            LazyVGrid(columns: imageColumns, spacing: 20) {
                ForEach(viewModel.favoriteArtistsModel[keyPath: category]) { artist in
                    artistCell(artist, category: category)
                }
            }
        }
    }
    
    @ViewBuilder
    private func artistCell(_ artist: ArtistCellModel,
                            category: WritableKeyPath<ArtistModel, [ArtistCellModel]>) -> some View {
        Button {
            viewModel.onArtistsCellTapped(artist, of: category)
        } label: {
            VStack {
                artist.imageSource
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1),
                                 contentMode: .fit)
                    .clipShape(Circle())
                    .opacity(artist.opacity)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.digglePink)
                            .presentIf(artist.isOverlayViewPresented)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .presentIf(artist.isOverlayViewPresented)
                            .foregroundColor(.digglePink)
                            .background(Color.white.clipShape(Circle()))
                    }
                
                Text("\(artist.text)")
                    .font(.re14)
                    .foregroundColor(.gray)
            }
        }
        .disabled(viewModel.favoriteArtistsModel.isArtistCellDisabeld)
    }
}

struct FavoriteArtistsVIew_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteArtistsView(viewModel: SettingViewModel())
    }
}

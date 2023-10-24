//
//  FavoriteGenreView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/24.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FavoriteGenreFeature: Reducer {
    
    struct State: Equatable {
        var selectedGenres: IdentifiedArrayOf<FavoriteGenre> = FavoriteGenre.genres
    }
    
    enum Action {
        case onGenreTapped(FavoriteGenre)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onGenreTapped(let genre):
                guard state.selectedGenres.isSectionEnabled || genre.isSelected
                else { return .none}
                
                guard let index = state.selectedGenres.index(id: genre.id)
                else { return .none }
                
                state.selectedGenres[index].isSelected.toggle()
                
                return .none
            }
        }
    }
}

struct FavoriteGenreView: View {
    
    let store: StoreOf<FavoriteGenreFeature>
    let imageColumns: [GridItem] = [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())]
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
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
                                ForEach(viewStore.selectedGenres) { genre in
                                    Button {
                                        viewStore.send(.onGenreTapped(genre))
                                    } label: {
                                        Image(genre.imageSource)
                                            .resizable()
                                            .aspectRatio(CGSize(width: 1, height: 1),
                                                         contentMode: .fit)
                                            .clipShape(Circle())
                                            .opacity(genre.opacity)
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
                        }
                        .padding(.horizontal)
                    }
                    
                    Button {
                        
                    } label: {
                        DiggleShape.roundedRectangle() 
                            .foregroundColor(viewStore.selectedGenres.buttonForegroundColor)
                    }
                    .buttonStyle(TextOverlayStyle(text: viewStore.selectedGenres.buttonText))
                }
            }
        }
    }
}

struct FavoriteGenreView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGenreView(store: Store(initialState: FavoriteGenreFeature.State(),
                                       reducer: {
            FavoriteGenreFeature()
        }))
    }
}

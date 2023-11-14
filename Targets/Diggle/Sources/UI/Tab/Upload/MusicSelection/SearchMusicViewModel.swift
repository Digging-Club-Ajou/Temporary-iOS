//
//  SearchMusicViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/10.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class SearchMusicViewModel: ObservableObject {
    @Published var musicSelectionModel = MusicSelectionModel()
    private let uploadService = UploadService.shared
    
    func onChageOfMusicSelectionFocusField() {
        musicSelectionModel.isViewInformationPresented = false
    }
    
    func onChageOfMusicSelectionSearchText(_ text: String) {
        musicSelectionModel.state = .searchTextEditing
        musicSelectionModel.songs = []
    }
    
    func onMusicSelectionSearchEndButtonTapped() {
        musicSelectionModel.focusField = nil
    }
    
    func onMusicSelectionSubmit() {
        Task {
            do {
                musicSelectionModel.state = .searchEnded
                let response = try await uploadService.searchMusicBy(keyword: musicSelectionModel.searchText)
                musicSelectionModel.songs = response.spotifySearchDtos.map { SongCellModel(dto: $0) }
            } catch {
                
            }
        }
    }
    
    func onSongCellTapped(_ song: SongCellModel) {
        UploadNavigateManager.shared.navigateTo(.card)
    }
}

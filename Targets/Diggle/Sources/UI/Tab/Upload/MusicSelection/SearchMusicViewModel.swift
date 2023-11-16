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
    
    @MainActor
    func onMusicSelectionSubmit() {
        Task {
            do {
                musicSelectionModel.state = .searchEnded
                let response = try await uploadService.findMusic(with: musicSelectionModel.searchText)
                musicSelectionModel.songs = response.spotifySearchDtos.map { SongCellModel(dto: $0) }
            } catch {
                debugPrint("onMusicSelectionSubmit: \(error)")
            }
        }
    }
    
    func onSongCellTapped(_ song: SongCellModel) {
        UploadNavigateManager.shared.navigateTo(.card)
    }
}

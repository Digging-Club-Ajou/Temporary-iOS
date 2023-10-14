//
//  AlbumCoverViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

final class AlbumCoverViewModel: ObservableObject {
    @Published var isCamreraPresented: Bool = false
    @Published var model: AlbumCoverModel
    @Published var musicSelectionModel = MusicSelectionModel()
    @Published var melodyCardModel = MelodyCardModel(songCellModel: .mock())
    @Published var settingLocationModel = SettingLocationModel()
    
    private let navigateUploadManager: NavigateUploadManager = .shared
    
    init(data: Data) {
        model = AlbumCoverModel(data: data)
    }
    
    init(image: Image) {
        model = AlbumCoverModel(image: image)
    }
    
    func onTakeAgainButtonTapped() {
        isCamreraPresented = true 
    }
    
    func onUsePhotoButtonTapped() {
        model.isImageConfirmed = true
    }
}

// MusicSelectionView에서 사용될 기능들
extension AlbumCoverViewModel {
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
        musicSelectionModel.state = .searchEnded
        musicSelectionModel.songs = [.mock(), .mock(), .mock()]
    }
}

// For PaletteBackground
extension AlbumCoverViewModel: PaletteButtonViewModel {
    func onColorTapped(_ color: Color) {
        melodyCardModel.background.color = color
    }
}

// For SettingLocationView
extension AlbumCoverViewModel: SearchViewModel, LocationCellViewModel {
    var searchModel: SearchModel {
        self.settingLocationModel
    }
    
    func onSearchEndButtonTapped() {
        
    }
    
    func onSearchSubmit() {
        settingLocationModel.locations = LocationCellModel.mocks()
        settingLocationModel.isFindWithCurrentLocationButtonPresented = false
    }
    
    func onLocationCellTapped(_ location: LocationCellModel) {
        
    }
    
    var textBinding: Binding<String> {
        .init {
            self.settingLocationModel.text
        } set: {
            self.settingLocationModel.isFindWithCurrentLocationButtonPresented = false
            self.settingLocationModel.text = $0
        }
    }
}

//  For MelodyCardSettingView
extension AlbumCoverViewModel {
    func onMelodyCardSettingCameraButtonTapped() {
        melodyCardModel.isCameraViewPresented = true 
    }
    
    func onMelodyCardSettingOnAppear() {
        melodyCardModel.isMelodyCardOnTop = true 
    }
}

//  For MelodyCardPreview
extension AlbumCoverViewModel {
    func onMelodyCardPreviewCompleteButtonTapped() {
        navigateUploadManager.popLast()
    }
}

extension AlbumCoverViewModel: CaptureDelegate {
    func onCameraCaptureButtonTapped(data: Data) {
        if melodyCardModel.isMelodyCardOnTop {
            melodyCardModel.isCameraViewPresented = false
            melodyCardModel.imageData = data
        } else {
            isCamreraPresented = false
            model = AlbumCoverModel(data: data)
        }
    }
}

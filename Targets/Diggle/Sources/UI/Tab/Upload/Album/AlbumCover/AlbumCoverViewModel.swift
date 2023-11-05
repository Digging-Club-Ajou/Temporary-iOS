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
    @Published var melodyCardModel = MelodyCardModel(songCellModel: .mock())
    @Published var settingLocationModel = SettingLocationModel()
    
    private let navigateUploadManager: UploadNavigateManager = .shared
    private let uploadService: UploadService = .shared
    
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

extension AlbumCoverViewModel {
    func onAlbumCompleteButtonTapped() {
        Task {
            try? await uploadService.postMelodyAlbum(request: model.request)
            navigateUploadManager.popLast()
        }
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
    var searchModel: any SearchModel {
        self.settingLocationModel
    }
    
    func onSearchEndButtonTapped() {
        
    }
    
    func onSearchSubmit() {
        Task {
            do {
                settingLocationModel.isFindWithCurrentLocationButtonPresented = false
                let response = try await uploadService.searchLocation(query: settingLocationModel.text,
                                                                      x: settingLocationModel.latitude,
                                                                      y: settingLocationModel.longitue)
            } catch {
                
            }
        }
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

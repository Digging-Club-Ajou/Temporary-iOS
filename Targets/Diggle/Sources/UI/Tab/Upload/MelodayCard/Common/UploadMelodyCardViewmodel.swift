//
//  UploadMelodyCardViewmodel.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/10.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

final class UploadMelodyCardViewModel: ObservableObject {
    @Published var musicSelectionModel = MusicSelectionModel()
    @Published var melodyCardModel = MelodyCardModel(songCellModel: .mock())
    @Published var settingLocationModel = SettingLocationModel()
    
    private let uploadService = UploadService.shared
    private let uploadNavigateManager = UploadNavigateManager.shared
    private var postMelodyCardRequest: PostMelodayCardRequest {
        .init(melodyCardRequest: .init(artistName: melodyCardModel.songCellModel.singer,
                                       songTitle: melodyCardModel.songCellModel.title,
                                       genre: melodyCardModel.songCellModel.genre,
                                       previewUrl: melodyCardModel.songCellModel.imageURL,
                                       address: settingLocationModel.selectedLocation?.locationText ?? "",
                                       cardDescription: melodyCardModel.text,
                                       color: "#\(melodyCardModel.background.rgb)"),
              melodyImage: melodyCardModel.imageData ?? .empty)
    }
}

// For PaletteBackground
extension UploadMelodyCardViewModel: PaletteButtonViewModel {
    func onColorTapped(_ color: Color) {
        melodyCardModel.background.color = color
    }
}

// For SettingLocationView
extension UploadMelodyCardViewModel: SearchViewModel, LocationCellViewModel {
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
extension UploadMelodyCardViewModel {
    func onMelodyCardSettingCameraButtonTapped() {
        melodyCardModel.isCameraViewPresented = true
    }
    
    func onMelodyCardSettingOnAppear() {
        melodyCardModel.isMelodyCardOnTop = true
    }
}

//  For MelodyCardPreview
extension UploadMelodyCardViewModel {
    func onMelodyCardPreviewCompleteButtonTapped() {
        Task {
            try? await uploadService.postMelodyCard(request: postMelodyCardRequest)
            uploadNavigateManager.popLast()
        }
    }
}

extension UploadMelodyCardViewModel: CaptureDelegate {
    func onCameraCaptureButtonTapped(data: Data) {
        melodyCardModel.isCameraViewPresented = false
        melodyCardModel.imageData = data
    }
}

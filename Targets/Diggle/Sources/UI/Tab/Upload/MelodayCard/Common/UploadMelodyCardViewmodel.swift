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
    
    private let uploadService = UploadService.shared
    private let uploadNavigateManager = UploadNavigateManager.shared
}

// For PaletteBackground
extension UploadMelodyCardViewModel: PaletteButtonViewModel {
    func onColorTapped(_ color: Color) {
        melodyCardModel.background.color = color
    }
    
    func onPaletteCompleteButtonTapped() {
        uploadNavigateManager.navigateTo(.location(melodyCardModel))
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

extension UploadMelodyCardViewModel: CaptureDelegate {
    func onCameraCaptureButtonTapped(data: Data) {
        melodyCardModel.isCameraViewPresented = false
        melodyCardModel.imageData = data
    }
}

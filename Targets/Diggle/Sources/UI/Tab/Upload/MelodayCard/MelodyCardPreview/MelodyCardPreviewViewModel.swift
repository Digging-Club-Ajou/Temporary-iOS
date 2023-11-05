//
//  MelodyCardPreviewViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/10.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class MelodyCardPreviewViewModel: ObservableObject {
    
    @Published var melodyCardModel: MelodyCardModel
    private let settingLocationModel: SettingLocationModel
    private let uploadService: UploadService = .shared
    
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
    
    init(melodyCardModel: MelodyCardModel,
         settingLocationModel: SettingLocationModel) {
        self.melodyCardModel = melodyCardModel
        self.settingLocationModel = settingLocationModel
    }
    
    func onMelodyCardPreviewCompleteButtonTapped() {
        Task {
            try? await uploadService.postMelodyCard(request: postMelodyCardRequest)
            UploadNavigateManager.shared.popLast()
        }
    }
}

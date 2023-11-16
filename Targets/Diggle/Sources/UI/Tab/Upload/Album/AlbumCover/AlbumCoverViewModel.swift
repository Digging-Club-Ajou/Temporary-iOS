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
    
    @MainActor
    func onAlbumCompleteButtonTapped() {
        Task {
            try? await uploadService.postMelodyAlbum(request: model.request)
            navigateUploadManager.popLast()
        }
    }
}

extension AlbumCoverViewModel: CaptureDelegate {
    func onCameraCaptureButtonTapped(data: Data) {
        isCamreraPresented = false
        model = AlbumCoverModel(data: data)
    }
}

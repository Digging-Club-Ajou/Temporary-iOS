//
//  UploadViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class UploadViewModel: ObservableObject {
    
    private let uploadService: UploadServiceProtocol =  UploadService.shared
    private let navigateUploadManager: UploadNavigateManager = .shared
    @Published var isCameraViewPresented: Bool = false
    
    func onCameraButtonTapped() {
        Task {
            do {
                let response = try await uploadService.verifyAlbumExistence()
                if response.alreadyExist {
                    navigateUploadManager.navigateTo(.searchMusic)
                } else {
                    isCameraViewPresented = true
                }
            } catch {
                debugPrint("error: \(error)")
            }
        }
    }
}

extension UploadViewModel: CaptureDelegate {    
    func onCameraCaptureButtonTapped(data: Data) {
        isCameraViewPresented = false
        navigateUploadManager.navigateTo(.album(data))
    }
}

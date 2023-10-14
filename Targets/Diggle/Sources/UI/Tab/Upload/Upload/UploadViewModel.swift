//
//  UploadViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class UploadViewModel: ObservableObject {
    
    private let navigateUploadManager: NavigateUploadManager = .shared
    @Published var isCameraViewPresented: Bool = false
    
    func onCameraButtonTapped() {
        isCameraViewPresented = true 
    }
}

extension UploadViewModel: CaptureDelegate {    
    func onCameraCaptureButtonTapped(data: Data) {
        isCameraViewPresented = false
        navigateUploadManager.navigateTo(.albumCover(data))
    }
}

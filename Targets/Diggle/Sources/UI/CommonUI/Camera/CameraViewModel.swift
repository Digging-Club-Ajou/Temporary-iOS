//
//  CameraViewModel.swift
//  CameraStudy
//
//  Created by 노우영 on 2023/10/15.
//

import Foundation
import AVFoundation
import SwiftUI
import Combine


class CameraViewModel: ObservableObject {
    private let model: Camera
    private let session: AVCaptureSession
    private weak var captureDelegate: CaptureDelegate?

    
    let output = AVCapturePhotoOutput()
    let cameraPreview: AnyView
    
    private var subscriptions = Set<AnyCancellable>()
    
    // ✅ 변수 추가
    @Published var data: Data?
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    
    @MainActor
    func configure() {
        model.requestAndCheckPermissions()
    }
    
    func switchFlash() {
        isFlashOn.toggle()
    }
    
    func switchSilent() {
        isSilentModeOn.toggle()
    }
    
    func capturePhoto() {
        // ✅ 추가
        debugPrint("Photo capture")
        model.capturePhoto()
    }
    
    func changeCamera() {
        model.changeCamera()
    }
    
    
    init(captureDelegate: CaptureDelegate) {
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
        self.captureDelegate = captureDelegate
        
        // ✅ sink 추가
        model.$photoData.sink {  [weak self] (data) in
            guard let data = data else { return }
            captureDelegate.onCameraCaptureButtonTapped(data: data)
        }
        .store(in: &self.subscriptions)
    }
}

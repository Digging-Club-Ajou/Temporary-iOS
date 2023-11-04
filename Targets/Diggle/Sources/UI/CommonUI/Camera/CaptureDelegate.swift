//
//  CaptureDelegate.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/15.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

protocol CaptureDelegate: AnyObject {
    func onCameraCaptureButtonTapped(data: Data) 
}

final class NullCaptureDelegate: CaptureDelegate {
    func onCameraCaptureButtonTapped(data: Data) {
        
    }
}

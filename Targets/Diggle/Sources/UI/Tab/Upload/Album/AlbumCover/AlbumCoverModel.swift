//
//  AlbumCoverModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct AlbumCoverModel {
    
    let imageData: Data
    var albumTitle: String = ""
    var focusField: FocusField?
    let image: Image

    var isAlbumInformationPresented: Bool {
        isImageConfirmed && albumTitle.isEmpty && focusField == nil
    }
    
    var isAlbumTitlePresented: Bool {
        isImageConfirmed
    }
    
    var isAlbumTitleRestrictionInformationPresented: Bool {
        isImageConfirmed && focusField == .albumTitle
    }
    
    var isBottomSpacerPresented: Bool {
        isImageConfirmed
    }
    
    var isCompleteButtonPresented: Bool {
        !albumTitle.isEmpty && isImageConfirmed
    }
    
    var isTakeAgainButtonPresented: Bool {
        !isImageConfirmed
    }
    
    var isUsePhotoButtonPresented: Bool {
        !isImageConfirmed
    }
    
    var request: PostAlbumRequest {
        PostAlbumRequest(albumName: albumTitle, imageData: imageData)
    }
    
    var isImageConfirmed: Bool = false
    
    var title: String {
        isImageConfirmed ? "앨범 커버 촬영" : "플레이리스트 앨범 만들기" 
    }
}

extension AlbumCoverModel {
    init(data: Data) {
        self.imageData = data
        self.image = Image(uiImage: UIImage(data: imageData) ?? .remove)
    }
    
    init(image: Image) {
        imageData = .empty
        self.image = image
    }
}

extension AlbumCoverModel {
    enum FocusField: String, Hashable {
        case albumTitle
    }
}

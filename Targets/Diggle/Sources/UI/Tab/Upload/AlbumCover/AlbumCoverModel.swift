//
//  AlbumCoverModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct AlbumCoverModel {
    var albumTitle: String = ""
    var focusField: FocusField? 

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
    
    let image: Image
    
    var isTakeAgainButtonPresented: Bool {
        !isImageConfirmed
    }
    
    var isUsePhotoButtonPresented: Bool {
        !isImageConfirmed
    }
    
    var isImageConfirmed: Bool = false
    
    var title: String {
        isImageConfirmed ? "앨범 커버 촬영" : "플레이리스트 앨범 만들기" 
    }
}

extension AlbumCoverModel {
    init(data: Data) {
        image = Image(uiImage: UIImage(data: data) ?? .remove)
    }
}

extension AlbumCoverModel {
    enum FocusField: String, Hashable {
        case albumTitle
    }
}

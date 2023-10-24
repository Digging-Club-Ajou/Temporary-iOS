//
//  MelodyCardModel .swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct MelodyCardModel: Hashable {
    
    var text: String = ""
    var imageData: Data?
    var isMelodyCardOnTop = false
    var songCellModel: SongCellModel
    var background: MelodyCardBackgroundModel = MelodyCardBackgroundModel(color: .blue00C2FF)
    var isCameraViewPresented: Bool = false
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData ?? .empty) ?? .checkmark)
    }
    
    var isImagePresented: Bool {
        imageData != nil 
    }
    
    static func mock() -> MelodyCardModel {
        MelodyCardModel(songCellModel: .mock())
    }
    
    static func previewMock() -> MelodyCardModel {
        MelodyCardModel(imageData: .empty, songCellModel: .mock())
    }
}



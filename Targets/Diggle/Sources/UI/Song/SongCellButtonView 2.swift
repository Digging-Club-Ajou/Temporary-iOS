//
//  SongCellView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SongCellButtonView<ViewModel: SongCellViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    let model: SongCellModel
    
    var body: some View {
        Button {
            viewModel.onSongTapped(model)
        } label: {
            SongCellLabelView(model: model)
        }

    }
}

struct SongCellView_Previews: PreviewProvider {
    static var previews: some View {
        SongCellButtonView(viewModel: NullSongCellViewModel(),
                           model: .mock())
    }
}

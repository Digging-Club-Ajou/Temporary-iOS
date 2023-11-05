//
//  SongCellLabelView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/16.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Kingfisher
import SwiftUI

struct SongCellLabelView: View {
    
    let model: SongCellModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: model.imageURL))
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.bo14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                
                Text(model.singer)
                    .font(.re12)
                    .foregroundColor(.gray767676)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.primary)
                .frame(width: 12, height: 24)
                .fontWeight(.semibold)
        }
    }
}

struct SongCellLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SongCellLabelView(model: .mock())
    }
}

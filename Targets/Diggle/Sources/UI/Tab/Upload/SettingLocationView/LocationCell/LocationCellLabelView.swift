//
//  LocationCellView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct LocationCellLabelView: View {
    
    let model: LocationCellModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.locationText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.re18)
            
            Text(model.distanceText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.re14)
                .foregroundColor(.gray767676)
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellLabelView(model: .mock())
    }
}

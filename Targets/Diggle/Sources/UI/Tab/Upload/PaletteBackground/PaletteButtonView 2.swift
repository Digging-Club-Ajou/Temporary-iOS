//
//  PaletteButtonView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/19.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct PaletteColor {
    static let colors: [Color] = [.redFF0000, .orangeFF5C00, .yellowFFD600,
                                  .greenA9F900, .green00D923, .blue00EAB2,
                                  .blue00C2FF, .navy1400FF, .purple9E00FF,
                                  .redFF006B, .pinkFEC4E4, .black]
}

struct PaletteButtonView<ViewModel: PaletteButtonViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    private let columns: [GridItem] = [GridItem](repeating: .init(.flexible(), spacing: 20),
                                                 count: 6)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(PaletteColor.colors, id: \.self) { color in
                Button {
                    viewModel.onColorTapped(color)
                } label: {
                    Circle()
                        .foregroundColor(color)
                        .overlay {
                            Circle()
                                .stroke()
                                .foregroundColor(.black)
                        }
                }
            }
        }
    }
}

struct PaletteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PaletteButtonView(viewModel: NullPaletteButtonViewModel())
    }
}

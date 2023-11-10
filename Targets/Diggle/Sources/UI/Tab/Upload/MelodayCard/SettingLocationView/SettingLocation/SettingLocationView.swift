//
//  SettingLocationView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SettingLocationView: View {
    
    @StateObject private var viewModel: SettingLocationViewModel
    
    init(melodyCardModel: MelodyCardModel) {
        let viewModel = SettingLocationViewModel(
            melodyCardModel: melodyCardModel
        )
        
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            SearchView(viewModel: viewModel)
            
            Button {
                
            } label: {
                Text("현재 위치로 찾기")
                    .font(.re14)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.pinkFEC4E4)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .presentIf(viewModel.settingLocationModel.isFindWithCurrentLocationButtonPresented)

            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(viewModel.settingLocationModel.locations) { location in
                        Button {
                            viewModel.onLocationCellTapped(location)
                        } label: {
                            LocationCellLabelView(model: location)
                        }
                    }
                }
            }
        }
        .customTitle("장소 검색")
        .animation(.spring(), value: viewModel.settingLocationModel.isFindWithCurrentLocationButtonPresented)
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
//                NavigationLink {
//                    MelodyCardPreviewView(viewModel: viewModel)
//                } label: {
//                    Text("건너뛰기")
//                        .font(.re14)
//                        .foregroundColor(.gray999999)
//                }
            }
        }
    }
}

struct SettingLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingLocationView(melodyCardModel: .mock())
        }
    }
}

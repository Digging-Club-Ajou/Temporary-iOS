//
//  SearchView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SearchView<ViewModel: SearchViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray767676)
            
            TextField(viewModel.searchModel.placeholder,
                      text: viewModel.textBinding)
                .overlay(alignment: .trailing) {
                    searchEndButton()
                }
                .onSubmit {
                    viewModel.onSearchSubmit()
                }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.grayE9E9EA)
        )
    }
    
    private func searchEndButton() -> some View {
        Button {
            viewModel.onSearchEndButtonTapped()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray767676)
        }
        .presentIf(viewModel.searchModel.isSearchEndButtonPreseneted)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: NullSearchViewModel())
    }
}

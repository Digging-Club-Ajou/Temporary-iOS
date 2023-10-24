//
//  DiggleTabbarView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct DiggleTabbarView: View {
    
    @EnvironmentObject var diggleTabManager: DiggleTabManager
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                diggleTabManager.onTabTapped(.home)
            } label: {
                DiggleTabModel.home.image(diggleTabManager.selection)
            }

            Spacer()
            
            
            Button {
                diggleTabManager.onTabTapped(.upload)
            } label: {
                DiggleTabModel.upload.image(diggleTabManager.selection)
            }
            
            Spacer()
            
            Button {
                diggleTabManager.onTabTapped(.profile)
            } label: {
                DiggleTabModel.profile.image(diggleTabManager.selection)
            }
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.2), radius: 1, x: 0, y: -5)
        )
        .ignoresSafeArea(.all)
    }
}

struct DiggleTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        DiggleTabbarView()
            .environmentObject(DiggleTabManager.shared)
    }
}

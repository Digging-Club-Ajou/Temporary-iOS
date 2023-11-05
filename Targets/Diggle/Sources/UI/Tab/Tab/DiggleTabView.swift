//
//  DiggleTabView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import SwiftUIIntrospect

struct DiggleTabView: View {
    
    @EnvironmentObject var diggleTabManager: DiggleTabManager
    
    var body: some View {
        TabView(selection: $diggleTabManager.selection) {
            HomeView()
                .tag(DiggleTabModel.home)
                .tabItem {
                    DiggleTabModel.home.image(diggleTabManager.selection)
                }
            
            
            NavigateUploadView()
                .tag(DiggleTabModel.upload)
                .tabItem {
                    DiggleTabModel.upload.image(diggleTabManager.selection)
                }
            
            Text("Profile")
                .tag(DiggleTabModel.profile)
                .tabItem {
                    DiggleTabModel.profile.image(diggleTabManager.selection)
                }
        }
        .useCustomTabbar()
        .ignoresSafeArea(.keyboard, edges: .all)
        .ignoresSafeArea(.all)
    }
}

struct DiggleTabView_Previews: PreviewProvider {
    static var previews: some View {
        DiggleTabView()
            .environmentObject(DiggleTabManager.shared)
    }
}

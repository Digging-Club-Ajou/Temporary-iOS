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
        .onAppear {
            // accessToken 저장을 위한 임시 기능입니다.
            // 추후 로그인이 정상적으로 동작하면 삭제합니다.
            DataManager.shared.storeAccessToken("eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI2Y2MyMzQ4Yy1jMjEyLTQ4YjQtODM5Ny0zZjhhMWQyZjAzNTYiLCJzdWIiOiJ7XCJpZFwiOjEsXCJ1c2VybmFtZVwiOlwid29veW91bmcxMjNfXCIsXCJuaWNrbmFtZVwiOlwid29veW91bmcxMjNfXCJ9IiwiaWF0IjoxNjk5Nzk5NzkyLCJleHAiOjE3Nzc1NTk3OTJ9.Zdn8OMTTRs7GeV42TlNoNJ6voZyhvikduJOLdwpx9UI")
        }
    }
}

struct DiggleTabView_Previews: PreviewProvider {
    static var previews: some View {
        DiggleTabView()
            .environmentObject(DiggleTabManager.shared)
    }
}

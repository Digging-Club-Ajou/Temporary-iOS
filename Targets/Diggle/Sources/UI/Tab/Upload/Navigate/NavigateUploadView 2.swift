//
//  UploadNavigateView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/14.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import SwiftUIIntrospect

struct NavigateUploadView: View {
    
    @EnvironmentObject var navigateUploadManager: NavigateUploadManager
    
    var body: some View {
        NavigationStack(path: $navigateUploadManager.paths) {
            UploadView()
                .tint(.primary)
                .navigationDestination(for: UploadPath.self) {
                    switch $0 {
                    case let .albumCover(data):
                        AlbumCoverView(data: data)
                    }
                }
        }
        .tint(.primary)
    }
}

struct UploadNavigateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigateUploadView()
            .environmentObject(AccountManager.shared)
    }
}

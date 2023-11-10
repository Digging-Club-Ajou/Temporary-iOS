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
    
    @EnvironmentObject var navigateUploadManager: UploadNavigateManager
    
    var body: some View {
        NavigationStack(path: $navigateUploadManager.paths) {
            UploadView()
                .tint(.primary)
                .navigationDestination(for: UploadPath.self) {
                    switch $0 {
                    case let .album(data):
                        AlbumCoverView(data: data)
                    case .card:
                        UploadMelodyCardView()
                    case .searchMusic:
                        EmptyView()
                    case let .preview(melodayCardModel,
                                      settingLocationModel):
                        MelodyCardPreviewView(
                            melodyCardModel: melodayCardModel,
                            settingLocationModel: settingLocationModel
                        )
                    case .location(let melodyCardModel):
                        SettingLocationView(
                            melodyCardModel: melodyCardModel
                        )
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

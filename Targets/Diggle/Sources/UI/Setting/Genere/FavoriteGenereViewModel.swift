//
//  FavoriteGenereViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation
import AVFoundation
import CoreLocation
import Photos

final class SettingViewModel: ObservableObject {
    @Published private(set) var favoriteGenreModel = FavoriteGenreModel()
    @Published private(set) var favoriteArtistsModel = ArtistModel()
    @Published var setNicknameModel = SetNicknameModel()
    
    private let displayManager: DisplayManager = .shared
    
    func onGenreCellTapped(_ genre: FavoriteGenreCellModel) {
        guard favoriteGenreModel.isSectionEnabled || genre.isSelected
        else { return }
        
        guard let index = favoriteGenreModel.genres.firstIndex(where: { $0.id == genre.id })
        else { return }
        
        favoriteGenreModel.genres[index].isSelected.toggle()
    }
    
    func onArtistsCellTapped(_ artist: ArtistCellModel,
                             of keyPath: WritableKeyPath<ArtistModel, [ArtistCellModel]>) {
        
        let artistsInCategory = favoriteArtistsModel[keyPath: keyPath]
        guard let index = artistsInCategory.firstIndex(where: { $0.id == artist.id })
        else { return }
        
        favoriteArtistsModel[keyPath: keyPath][index].isSelected.toggle()
    }
}


//  For AuthorityView
extension SettingViewModel {
    func onAuthorityViewAppear() {
        AVCaptureDevice.requestAccess(for: .video) { _ in }
        PHPhotoLibrary.requestAuthorization { _ in }
        CLLocationManager().requestWhenInUseAuthorization()
    }
    
    func onSetNicknameViewXButtonTapped() {
        setNicknameModel.nickname = "" 
    }
    
    func onChageOfNickname(_ nickname: String) {
        setNicknameModel.nicknameState = .enable
    }
    
    func onSetNicknameCompleteButtonTapped() {
        
    }
}

//  For CompleteSettingView
extension SettingViewModel {
    func onCompleteSettingButtonTapped() {
        displayManager.display(.main)
    }
}

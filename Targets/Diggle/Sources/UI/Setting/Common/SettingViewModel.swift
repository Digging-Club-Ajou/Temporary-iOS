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
    private let accountService: AccountServiceProtocol
    
    private var timerForNicknameSetting: Timer?
    private var nicknameValidateRequestTrigger: Int
    private let nicknameValidateRequestFlag = 0
    private let triggerOriginValue = 5
    private var isNicknameValidationRequestEnabeld: Bool {
        nicknameValidateRequestTrigger == nicknameValidateRequestFlag  && setNicknameModel.nicknameState == .waiting
    }

    init(accountService: AccountServiceProtocol = AccountService()) {
        self.accountService = accountService
        nicknameValidateRequestTrigger = triggerOriginValue
    }
    
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
}

//  For SetNicknameView
extension SettingViewModel {
    func onSetNicknameViewOnDisappear() {
        timerForNicknameSetting?.invalidate()
    }
    
    func onSetNicknameViewAppear() {
        timerForNicknameSetting = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.onTimerTicking()
        }
    }
    
    func onSetNicknameViewXButtonTapped() {
        setNicknameModel.nickname = ""
    }
    
    func onChageOfNickname(_ nickname: String) {
        nicknameValidateRequestTrigger = triggerOriginValue
        accountService.cancelNicknameValidation()
        setNicknameModel.nicknameState = .waiting
    }
    
    func onSetNicknameCompleteButtonTapped() {
        
    }
    
    @MainActor
    func onTimerTicking() {
        nicknameValidateRequestTrigger = max(nicknameValidateRequestTrigger - 1, nicknameValidateRequestFlag)
        guard isNicknameValidationRequestEnabeld else { return }
        validateNickname()
    }
    
    @MainActor
    private func validateNickname() {
        Task {
            do {
                let response = try await accountService.validateNickname(request: setNicknameModel.nicknameValidatinoRequest)
                debugPrint(response)
                setNicknameModel.nicknameState = .enable
                setNicknameModel.presentNicknameValidationResponse(response)
            } catch {
                setNicknameModel.nicknameState = .disable
                debugPrint(error)
            }
        }
    }
}

//  For CompleteSettingView
extension SettingViewModel {
    func onCompleteSettingButtonTapped() {
        Task {
            do {
                async let nicknameRequest = accountService.postNickname(request: setNicknameModel.postNicknameRequest)
                
                async let artistRequest: () = accountService.postFavoriteArtist(aritsts: favoriteArtistsModel.favoriteArtistRequest)
                
                async let genreRequest: () = accountService.postFavroiteGenere(genres: favoriteGenreModel.favoriteGenreRequest)
                
                let (_, _, _) = try await (nicknameRequest, artistRequest, genreRequest)
                
                displayManager.display(.main)
            } catch {

            }
        }
    }
}

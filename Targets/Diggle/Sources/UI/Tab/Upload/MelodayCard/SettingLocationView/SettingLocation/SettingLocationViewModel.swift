//
//  SettingLocationViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/21.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import CoreLocation

final class SettingLocationViewModel {
    @Published var settingLocationModel = SettingLocationModel()
    let uploadService = UploadService.shared
    private let melodyCardModel: MelodyCardModel
    
    init(melodyCardModel: MelodyCardModel) {
        self.melodyCardModel = melodyCardModel
    }
}

extension SettingLocationViewModel: LocationCellViewModel {
    func onLocationCellTapped(_ location: LocationCellModel) {
        settingLocationModel.selectedLocation = location
        UploadNavigateManager.shared.navigateTo(
            .preview(melodyCardModel,
                     settingLocationModel)
        )
    }
}

extension SettingLocationViewModel: SearchViewModel {
    var textBinding: Binding<String> {
        .init {
            self.settingLocationModel.text
        } set: {
            self.settingLocationModel.isFindWithCurrentLocationButtonPresented = false
            self.settingLocationModel.text = $0
        }

    }
    
    var searchModel: any SearchModel {
        settingLocationModel
    }
    
    func onSearchEndButtonTapped() {
        
    }
    
    func onSearchSubmit() {
        Task {
            do {
                let manager = CLLocationManager()
                manager.startUpdatingLocation()
                guard let location = manager.location else { return }
                debugPrint("location: \(location)")
                
                let response = try await uploadService.searchLocation(query: settingLocationModel.text,
                                                                      x: "\(location.coordinate.latitude)",
                                                                      y: "\(location.coordinate.longitude)")
                
                settingLocationModel.locations = response.locationResponses.map {
                    LocationCellModel(locationResponse: $0)
                }
            } catch {
                #if DEBUG
                debugPrint("location search error: \(error)")
                #endif
            }
        }
    }
}

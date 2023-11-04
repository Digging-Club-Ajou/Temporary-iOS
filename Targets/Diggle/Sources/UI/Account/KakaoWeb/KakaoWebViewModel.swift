//
//  KakaoWebViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class kakaoWebViewModel: ObservableObject {
    @Published var model = KakaoWebModel()
    
    private let accoutNavigateManager: AccountNavigateManager = .shared
    
    func onChageOfAuthCode(_ code: String?) {
        guard let code = code else { return }
        accoutNavigateManager.navigateTo(.genres)
    }
}

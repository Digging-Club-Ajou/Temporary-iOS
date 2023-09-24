//
//  LoginViewModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published private(set) var model = LoginModel()
}

extension LoginViewModel {
    var tabSelectionBinding: Binding<LoginInformationState> {
        .init {
            self.model.informationState
        } set: { newValue in
            self.model.informationState = newValue
        }

    }
}

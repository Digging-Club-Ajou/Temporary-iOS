//
//  SetNicknameModel.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/31.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct SetNicknameModel {
    var nickname: String = ""
    var nicknameState: NicknameState = .empty
    
    var guideText: String {
        switch nicknameState {
        case .empty:
            return "영문, 숫자, 밑줄, 마침표 중 두 가지 이상을 조합한 2~20자를 지원합니다."
        case .disable:
            return "다른 유저와 중복되는 아이디입니다."
        case .enable:
            return "사용 가능한 아이디입니다."
        }
    }
    
    var guideTextForegroundColor: Color {
        switch nicknameState {
        case .empty:
            return .clear
        case .disable:
            return .red
        case .enable:
            return .blue
        }
    }
    
    var isCompleteButtonDisable: Bool {
        nicknameState != .enable
    }
    
    var completeButtonForgroundColor: Color {
        isCompleteButtonDisable ? .grayE9E9EA : .pinkFEC4E4
    }
}

extension SetNicknameModel {
    enum NicknameState {
        case empty
        case enable
        case disable
    }
}

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
    var nicknameGuideText: String = ""
    var guideTextForegroundColor: Color = .clear

    var isCompleteButtonDisable: Bool {
        nicknameState != .enable
    }
    
    var completeButtonForgroundColor: Color {
        isCompleteButtonDisable ? .grayE9E9EA : .pinkFEC4E4
    }
    
    var nicknameValidatinoRequest: ValidateNicknameRequest {
        ValidateNicknameRequest(nickname: nickname)
    }
    
    var postNicknameRequest: PostNicknameRequest {
        PostNicknameRequest(nickname: nickname)
    }
    
    mutating func presentNicknameValidationResponse(_ response: ValidateNicknameResponse) {
        switch response.statusCode {
        case "200":
            guideTextForegroundColor = .blue
            nicknameState = .enable
        case "400":
            guideTextForegroundColor = .red
            nicknameState = .disable
        default:
            guideTextForegroundColor = .red
            nicknameState = .disable
        }
        
        nicknameGuideText = response.message
    }
}

extension SetNicknameModel {
    enum NicknameState {
        case empty
        case enable
        case disable
    }
}

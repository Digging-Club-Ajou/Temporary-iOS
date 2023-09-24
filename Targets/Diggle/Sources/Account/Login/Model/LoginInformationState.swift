//
//  LoginInformationState.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

enum LoginInformationState: Int, CaseIterable, Hashable, Identifiable {
    
    case first
    case second
    case third
    case fourth
    
    var id: String {
        String(self.rawValue)
    }
    
    var imageName: String {
        switch self {
        case .first:
            return "mp3"
        case .second:
            return "camera"
        case .third:
            return "earth"
        case .fourth:
            return "diggleLogo"
        }
    }
    
    var width: CGFloat {
        switch self {
        case .first:
            return 147
        case .second:
            return 251
        case .third:
            return 226
        case .fourth:
            return 152
        }
    }
    
    var height: CGFloat {
        switch self {
        case .first:
            return 249
        case .second:
            return 208
        case .third:
            return 226
        case .fourth:
            return 152
        }
    }
    
    var text: String {
        switch self {
        case .first:
            return """
특별한 순간에 들은 노래, \n어떻게 기억하시나요?
"""
        case .second:
            return """
소중한 시간, \n좋아하는 노래와 기록해보세요.
"""
        case .third:
            return """
나를 위한 앨범부터 새로운 앨범까지, \n세상의 수많은 앨범을 수집해보세요.
"""
        case .fourth:
            return """
세상에 단 하나뿐인 플레이리스트 \n노래로 기억하는 나만의 추억, 지금 시작해보세요!
"""
        }
    }
    
    var headerText: String {
        switch self {
        case .fourth:
            return "취향을 파고들다, diggle"
        default:
            return "" 
        }
    }
}

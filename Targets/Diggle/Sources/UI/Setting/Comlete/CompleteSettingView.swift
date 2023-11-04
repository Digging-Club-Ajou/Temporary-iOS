//
//  CompleteSettingView.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/01.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI

struct CompleteSettingView: View {
    
    @ObservedObject var viewModel: SettingViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image.Setting.settingComplete.image
            
            Text("취향 분석 완료!")
                .font(.bo24)
            
            Text("""
                \(viewModel.setNicknameModel.nickname) 님의 가입을 환영합니다.
                이제 디글과 함께 취향을 공유하고 기록할 수 있습니다.
                """)
            .multilineTextAlignment(.center)
            .font(.re14)
            .lineSpacing(10)
            
            Spacer()
            
            Button {
                viewModel.onCompleteSettingButtonTapped()
            } label: {
                DiggleShape.roundedRectangle()
                    .foregroundColor(.digglePink)
            }
            .buttonStyle(TextOverlayStyle(text: "시작하기"))

        }
        .frame(alignment: .center)
    }
}

struct CompleteSettingView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSettingView(viewModel: SettingViewModel())
    }
}

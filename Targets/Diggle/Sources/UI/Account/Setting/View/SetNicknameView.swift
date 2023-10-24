//
//  SetNicknameView.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/30.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SetNicknameFeature: Reducer {
    struct State: Equatable {
        @BindingState var nickname: String = ""
        var state: NicknameState = .emptyOrChecking
        
        enum NicknameState {
            case emptyOrChecking
            case enable
            case disable
            
            var text: String {
                switch self {
                case .emptyOrChecking:
                    return ""
                case .disable:
                    return "다른 유저와 중복되는 아이디입니다"
                case .enable:
                    return "사용 가능한 아이디입니다"
                }
            }
            
            var foregroundColor: Color {
                switch self {
                case .disable:
                    return .redD56461
                case .enable:
                    return .blue6A8EF0
                case .emptyOrChecking:
                    return .clear
                }
            }
        }
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onXmarkButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding(_):
                // MARK: 뷰 확인을 위한 임시 동작
                state.state = .enable
                return .none
            case .onXmarkButtonTapped:
                state.nickname = ""
                return .none
            }
        }
    }
}

struct SetNicknameView: View {
    
    let store: StoreOf<SetNicknameFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                
                Spacer()
                
                Text("""
                    거의 다 왔어요!
                    닉네임을 설정해주세요
                    """)
                .font(.bo24)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    HStack {
                        Text("@")
                        TextField("guide_example",
                                  text: viewStore.$nickname)
                        
                        nickStateView(viewStore.state.state)
                        Button {
                            viewStore.send(.onXmarkButtonTapped)
                        } label: {
                            Image(.xmark)
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 10)
                    .background(
                        Rectangle().foregroundColor(.grayF4F4F4)
                    )
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.digglePink)
                    }
                    
                    Text(viewStore.state.state.text)
                        .foregroundColor(viewStore.state.state.foregroundColor)
                        .font(.re12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    DiggleShape.roundedRectangle(horizontalPadding: 0)
                        .foregroundColor(.digglePink)
                }
                .buttonStyle(TextOverlayStyle(text: "다음"))

            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    private func nickStateView(_ state: SetNicknameFeature.State.NicknameState) -> some View {
        switch state {
        case .emptyOrChecking:
            EmptyView()
        case .enable:
            Image(.check_blue)
        case .disable:
            Image(.exclamation_red)
        }
    }
}

struct SetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNicknameView(store: Store(
            initialState: SetNicknameFeature.State(),
            reducer: {
                SetNicknameFeature()
            }))
    }
}

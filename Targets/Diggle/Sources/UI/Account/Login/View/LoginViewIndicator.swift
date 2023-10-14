//
//  LoginViewIndicator.swift
//  Diggle
//
//  Created by 노우영 on 2023/09/20.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct LoginViewIndicator: View {
    
    let currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<4) { int in
                Capsule()
                    .frame(width: width(int), height: 15)
                    .foregroundColor(foregroundColor(int))
            }
        }
    }
    
    func width(_ index: Int) -> CGFloat {
        currentPage == index ? 60 : 15
    }
    
    func foregroundColor(_ index: Int) -> Color {
        currentPage == index ? .digglePink : .gray
    }
}

struct LoginViewIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewIndicator(currentPage: 0)
    }
}

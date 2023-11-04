//
//  DiggleWebView.swift
//  Diggle
//
//  Created by 노우영 on 2023/10/28.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import SwiftUI
import WebKit
 
struct DiggleWebView: UIViewRepresentable {
   
    @ObservedObject var viewModel: kakaoWebViewModel
    
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.viewModel.model.url) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<DiggleWebView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($viewModel.model.currentURL)
     }

     
    class Coordinator: NSObject, WKNavigationDelegate {
        var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            text.wrappedValue = webView.url?.absoluteString ?? ""
        }
    }
}

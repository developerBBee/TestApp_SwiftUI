//
//  WebViewPage.swift
//  testApp
//
//  Created by ak on 2023/06/11.
//

import SwiftUI
import WebKit

struct WebViewPage: View {
    var body: some View {
        NavigationView {
            WebView(loadUrl: URL(string: "https://www.apple.com")!)
        }.navigationBarTitle("WebPage", displayMode: .inline)
    }
}

struct WebView: UIViewRepresentable {
    let loadUrl: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: loadUrl)
        uiView.load(request)
    }
}

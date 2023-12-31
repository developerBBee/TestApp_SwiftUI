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
    var webView = WKWebView()
    var progressView = UIProgressView()

    class Coordinator: NSObject {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        // WebViewの読み込み状況を監視する
        func addProgressObserver() {
            parent.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        }

        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            // progressViewのアニメーション処理
            if keyPath == "estimatedProgress" {
                parent.progressView.alpha = 1.0
                parent.progressView.setProgress(Float(parent.webView.estimatedProgress), animated: true)

                if parent.webView.estimatedProgress >= 1.0 {
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: { [weak self] in
                        self?.parent.progressView.alpha = 0.0
                    }, completion: { (finished: Bool) in
                        self.parent.progressView.setProgress(0.0, animated: false)
                    })
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.addSubview(progressView)

        // UIProgressViewのレイアウト設定
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.widthAnchor.constraint(equalTo: webView.widthAnchor, multiplier: 1.0).isActive = true
        progressView.topAnchor.constraint(equalTo: webView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        progressView.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 0).isActive = true

        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        context.coordinator.addProgressObserver()

        let request = URLRequest(url: loadUrl)
        uiView.load(request)
    }
}

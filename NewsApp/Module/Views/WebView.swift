//
//  WebView.swift
//  NewsApp
//
//  Created by 陳峻琦 on 17/2/2022.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var htmlString: String
    var baseURL: URL?
    var store: WebViewStore?
    var scrollHeight: Binding<CGFloat>?
    
    func makeUIView(context: Context) -> WKWebView {
        store?.coodinator = context.coordinator
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        context.coordinator.wkWebView = webView
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseURL)
    }
    
    
    
    typealias UIViewType = WKWebView
    
    func makeCoordinator() -> WebViewCoodinator {
        WebViewCoodinator(self)
    }
}

class WebViewCoodinator: NSObject, WKNavigationDelegate {
    var wkWebView: WKWebView?
    var parent: WebView
    
    init(_ parent: WebView) {
        self.parent = parent
    }
    
    //字体大小缩放
    func zoom(zoom: Double) {
        let jsString =
        """
        document.querySelector(".articleContainer").style.zoom = \(zoom)
        """
        
        // 执行javascript方法
        wkWebView?.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    //获取高度
    private func getScrollHeight() {
        let jsString =
            """
            document.querySelector(".videoContainer").clientHeight
            """
        
        wkWebView?.evaluateJavaScript(jsString, completionHandler: { result, error in
            guard let height = result else {
                return
            }
            self.disableScroll()
            self.parent.scrollHeight?.wrappedValue = height as? CGFloat ?? 0
        })
    }
    
    //禁止webview滚动
    func disableScroll() {
        wkWebView?.scrollView.isScrollEnabled = false
        wkWebView?.scrollView.panGestureRecognizer.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        getScrollHeight()
    }
}

class WebViewStore: ObservableObject {
    var coodinator: WebViewCoodinator?
}

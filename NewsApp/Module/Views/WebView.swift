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
    var store: WebViewStore
    
    func makeUIView(context: Context) -> WKWebView {
        store.coodinator = context.coordinator
        let webView = WKWebView()
        context.coordinator.wkWebView = webView
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseURL)
    }
    
    
    
    typealias UIViewType = WKWebView
    
    func makeCoordinator() -> WebViewCoodinator {
        WebViewCoodinator()
    }
}

class WebViewCoodinator: NSObject {
    var wkWebView: WKWebView?
    
    func zoom(zoom: Double) {
        let jsString =
        """
        document.querySelector(".articleContainer").style.zoom = \(zoom)
        """
        
        // 执行javascript方法
        wkWebView?.evaluateJavaScript(jsString, completionHandler: nil)
    }
}

class WebViewStore: ObservableObject {
    var coodinator: WebViewCoodinator?
}

//
//  WKWebView+EX.swift
//  GoldenCoupon
//
//  Created by Eslam Mohamed on 1/27/22.
//

import Foundation

import WebKit
class WK:UIViewController,WKNavigationDelegate {
  
    fileprivate var webView = WKWebView()
    open var url:String?
    override func loadView() {
        
        webView.navigationDelegate = self
        view = webView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = .black
        guard let url = url ,!url.isEmpty else { return }
        webView.load(URLRequest(url: URL(string: url)!))
        webView.allowsBackForwardNavigationGestures = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
    }
}

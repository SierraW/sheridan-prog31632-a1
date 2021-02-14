//
//  WebKitViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-05.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com/ca/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        loadingIndicator.hidesWhenStopped = true
        
    }
    
    func showLoadingIndicator(_ show: Bool) {
        if show {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showLoadingIndicator(false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoadingIndicator(true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showLoadingIndicator(false)
    }

}

//
//  LoginViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/20/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController, UIWebViewDelegate {

    let webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }

    func configureWebView() {
        webView.delegate = self

        let engine = InstagramEngine.sharedEngine()
        let authURL = engine.authorizationURL()
        webView.loadRequest(NSURLRequest(URL: authURL))

        view.addSubview(webView)
        webView.pinToAllSidesOfSuperView()

        print(authURL)

    }

    func dismissModal() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - web view delegate methods

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        do {
            try InstagramEngine.sharedEngine().receivedValidAccessTokenFromURL(request.URL)
            dismissModal()
            return false
        } catch _ {

        }

        return true
    }
}

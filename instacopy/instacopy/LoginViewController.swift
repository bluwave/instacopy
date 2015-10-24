//
//  LoginViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/20/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController, UIWebViewDelegate, LoginViewInterface {

    let webView = UIWebView()
    var eventHandler: LoginModule

    internal init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, eventHandler: LoginModule)
    {
        self.eventHandler = eventHandler
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    // MARK: - web view delegate methods

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        do {
            try InstagramEngine.sharedEngine().receivedValidAccessTokenFromURL(request.URL)
            self.eventHandler.loginSucceeded()
            return false
        } catch _ {
        }
        return true
    }
}

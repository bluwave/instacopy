//
//  LoginViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/20/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit
import WebKit
import InstagramKit


class LoginViewController: UIViewController, UIWebViewDelegate, LoginViewInterface {

    let webView = UIWebView()
    var eventHandler: LoginModule

    internal init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, eventHandler: LoginModule) {
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

        let engine = InstagramEngine.shared()
        let authURL = engine.authorizationURL()
        webView.loadRequest(URLRequest(url: authURL))

        view.addSubview(webView)
        _ = webView.pinToAllSidesOfSuperView()

        print(authURL)

    }

    // MARK: - web view delegate methods

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        do {
            if let URL = request.url {
                try InstagramEngine.shared().receivedValidAccessToken(from: URL)
                self.eventHandler.loginSucceeded()
            }
            return false
        } catch let error {
            print("\(#function) error: \(error.localizedDescription)")
        }
        return true
    }
}

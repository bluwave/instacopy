//
//  LoginRouter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/23/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class LoginRouter: BaseRouter {

    var presenter: LoginPresenter?

    func showLogin(_ presentingViewController: UIViewController) {
        if let presenter = self.presenter {
            let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil,eventHandler: presenter)
            presenter.userInterface = viewController as LoginViewInterface
            presentViewController(viewController, presentingViewController: presentingViewController, animated: true, embedInNavigationController: true, completion: nil)
            self.viewController = viewController
        }
    }

    func dismiss()
    {
        if let viewController = self.viewController {
            viewController.dismiss(animated: true,completion: nil)
        }
    }
}

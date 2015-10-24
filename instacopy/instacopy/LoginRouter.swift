//
//  LoginRouter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/23/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class LoginRouter: BaseRouter {

    func showLogin(presentingViewController: UIViewController) {
        self.viewController = FeedViewController(nibName: "FeedViewController", bundle: nil)
        //  TODO - configure VIPER HERE
        if let viewController = self.viewController  {
//            presentViewController(viewController, presentingViewController: presentingViewController, animated: true, embedInNavigationController: true, completion: nil )
//            presentViewController(viewController, presentingViewController: presentingViewController, animated: true, embedInNavigationController:
            presentViewController(viewController,presentingViewController:presentingViewController,animated: true, embedInNavigationController: true, completion: nil)
        }

    }
}

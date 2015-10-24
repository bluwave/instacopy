//
//  BaseRouter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/23/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class BaseRouter: NSObject {

    weak var viewController: UIViewController?

    func presentViewController(viewController: UIViewController, presentingViewController: UIViewController, animated: Bool, embedInNavigationController: Bool, completion: (() -> Void)?) {
        var modalViewController = viewController
        if (embedInNavigationController) {
            modalViewController = UINavigationController(rootViewController: viewController)
        }
        presentingViewController.presentViewController(modalViewController, animated: animated, completion: completion)
    }

}

//
//  FeedRouter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class FeedRouter: BaseRouter {

    var loginRouter: LoginRouter?

    func showLogin() {
        guard
            let loginRouter = loginRouter,
            let viewController = self.viewController
        else {
            return
        }

        loginRouter.showLogin(viewController)
    }
}

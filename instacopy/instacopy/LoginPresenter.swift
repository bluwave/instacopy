//
//  LoginPresenter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/23/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

protocol LoginModule {
    func loginSucceeded()
}

protocol LoginViewInterface {

}

class LoginPresenter: BasePresenter, LoginModule {

    var userInterface:LoginViewInterface?

    var router: LoginRouter {
        get {
            return self.internalRouter as! LoginRouter
        }
    }

    
    func loginSucceeded(){
        self.router.dismiss()
    }
}

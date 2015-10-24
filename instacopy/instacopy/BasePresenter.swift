//
//  BasePresenter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class BasePresenter: NSObject {

    var internalInteractor: AnyObject
    var internalRouter: AnyObject

    init(interactor: AnyObject, router: AnyObject) {
        self.internalInteractor = interactor
        self.internalRouter = router
    }
}

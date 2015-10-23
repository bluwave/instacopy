//
//  CPYBasePresenter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class CPYBasePresenter: NSObject {

    var interactor: CPYFeedInteractorInput
    var router: AnyObject

    init(interactor: CPYFeedInteractorInput, router: AnyObject) {
        self.interactor = interactor
        self.router = router
    }
}

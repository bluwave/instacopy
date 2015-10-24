//
//  FeedPresenter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

protocol FeedModule
{
    func viewWillAppear()
}

class FeedPresenter: BasePresenter, FeedInteractorOutput, FeedModule {

    var interactor: FeedInteractorInput {
        get {
            return self.internalInteractor as! FeedInteractorInput
        }
    }

    var router: FeedRouter {
        get {
            return self.internalRouter as! FeedRouter
        }
    }

    func viewWillAppear() {
        if(!interactor.isAuthenticated())
        {
            router.showLogin()
        }
    }

}

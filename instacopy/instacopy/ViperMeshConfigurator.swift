//
//  ViperMeshConfigurator.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class VIPERMeshConfigurator: NSObject {


    init(dataManager: InstagramManager, rootViewController: UIViewController)
    {
        // feed
        let feedInteractor = FeedInteractor(dataManager: dataManager)
        let feedRouter = FeedRouter()
        let feedPresenter = FeedPresenter(interactor:feedInteractor, router:feedRouter)
        feedInteractor.output = feedPresenter

        // login
        let loginRouter = LoginRouter()
        feedRouter.loginRouter = loginRouter

        // configure root view
        if let rootViewController = rootViewController as? FeedViewController {
            rootViewController.eventHandler = feedPresenter
        }

    }

}

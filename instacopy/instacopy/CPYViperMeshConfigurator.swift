//
//  CPYViperMeshConfigurator.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class CPYVIPERMeshConfigurator: NSObject {


    init(dataManager: CPYInstagramManager, rootViewController: UIViewController)
    {
        // feed
        let feedInteractor = CPYFeedInteractor(dataManager: dataManager)
        let feedRouter = CPYFeedRouter()
        let feedPresenter = CPYFeedPresenter(interactor:feedInteractor, router:feedRouter)
        feedInteractor.output = feedPresenter


        // configure root view
        if let rootViewController = rootViewController as? CPYFeedViewController {
            rootViewController.eventHandler = feedPresenter
        }

    }

}

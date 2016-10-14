//
//  FeedPresenter.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

protocol FeedModule {
    func viewWillAppear()

    func refresh()
}

protocol FeedViewInterface {
    func showPosts(_ posts: [FeedPostModel])
}

class FeedPresenter: BasePresenter, FeedInteractorOutput, FeedModule {

    var userInterface: FeedViewInterface?

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
        if (!interactor.isAuthenticated()) {
            router.showLogin()
        } else {
            self.interactor.getFeed()
        }
    }

    func refresh() {
        self.interactor.getFeed()
    }


    func showPosts(_ posts: [FeedPostModel]) {
        if let ui = userInterface {
            ui.showPosts(posts)
        }
    }
}

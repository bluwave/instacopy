//
//  FeedInteractor.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

protocol FeedInteractorInput {
    func isAuthenticated() -> Bool
}

protocol FeedInteractorOutput {
}

class FeedInteractor: BaseInteractor, FeedInteractorInput {

    var output: FeedInteractorOutput?

    func isAuthenticated() -> Bool {
        return dataManager.isAuthenticated()
    }

}

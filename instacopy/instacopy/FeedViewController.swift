//
//  FeedViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var eventHandler: FeedModule?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let eventHandler = eventHandler {
            eventHandler.viewWillAppear()
        }

    }
}

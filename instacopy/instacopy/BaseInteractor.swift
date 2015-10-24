//
//  BaseInteractor.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class BaseInteractor: NSObject {
    
    var dataManager:InstagramManager
    
    init(dataManager:InstagramManager)
    {
        self.dataManager = dataManager
    }
}

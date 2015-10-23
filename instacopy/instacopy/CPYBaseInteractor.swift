//
//  CPYBaseInteractor.swift
//  instacopy
//
//  Created by Garrett Richards on 10/22/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class CPYBaseInteractor: NSObject {
    
    var dataManager:CPYInstagramManager
    
    init(dataManager:CPYInstagramManager)
    {
        self.dataManager = dataManager
    }
}

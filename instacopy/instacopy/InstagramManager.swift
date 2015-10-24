//
//  InstagramManager.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class InstagramManager: NSObject {

    let engine = InstagramEngine.sharedEngine()
    
    func login(username: String, password: String, completionHandler: ((error: NSError?) -> Void)?)
    {
        
    }

    func isAuthenticated() -> Bool {
        return engine.accessToken.characters.count > 0
    }
}

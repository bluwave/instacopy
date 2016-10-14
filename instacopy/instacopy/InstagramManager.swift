//
//  InstagramManager.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit
import InstagramKit


class InstagramManager: NSObject {

    let engine = InstagramEngine.shared()
    
    func login(_ username: String, password: String, completionHandler: ((_ error: NSError?) -> Void)?)
    {
        
    }

    func isAuthenticated() -> Bool {
        guard
            let accessToken = engine.accessToken
        else { return false }

        return accessToken.characters.count > 0
    }

    func getFeed(_ completion: @escaping ([FeedPostModel]) -> Void) {
        self.engine.getSelfFeed(withCount: 10, maxId: "", success: { (mediaPosts, paginationInfo) in
            var posts = [FeedPostModel]()
            for post in mediaPosts {
                    posts.append(FeedPostModel(instagramMedia: post))
            }

            completion(posts)

        }) { (error, statusCode) in
            print("error ")
        }
    }

}

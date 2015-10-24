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
        guard
            let accessToken = engine.accessToken
        else { return false }

        return accessToken.characters.count > 0
    }

    func getFeed(completion: ([FeedPostModel]) -> Void)
    {
        self.engine.getSelfFeedWithCount(10, maxId: "", success: {
            (objects: [AnyObject]!, paginationInfo: InstagramPaginationInfo!) -> Void in

            var posts = [FeedPostModel]()
            for obj in objects {
                if let post = obj as? InstagramMedia {
                    posts.append(FeedPostModel(instagramMedia: post))
                }
            }

            completion(posts)

        }) {
            (error: NSError!, Int) -> Void in
            print("error ")
        }
    }

}

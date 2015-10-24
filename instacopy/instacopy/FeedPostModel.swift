//
//  FeedPostModel.swift
//  instacopy
//
//  Created by Garrett Richards on 10/24/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import Foundation


struct FeedPostModel: CustomStringConvertible {

//    @property (nonatomic, readonly) InstagramUser* user;
//    
//    @property (nonatomic, readonly) NSDate *createdDate;
//
//    @property (nonatomic, readonly) NSString* link;
//    
//    @property (nonatomic, readonly) InstagramComment* caption;
//
//    @property (nonatomic, readonly) NSInteger likesCount;
//
//    @property (nonatomic, readonly) NSArray *likes;
//
//    @property (nonatomic, readonly) NSInteger commentCount;
//
//    @property (nonatomic, readonly) NSArray *comments;
//    
//    @property (nonatomic, readonly) NSString *locationId;
//    
//    @property (nonatomic, readonly) NSString *locationName;
//    
//    @property (nonatomic, readonly) NSURL *standardResolutionImageURL;
//
//    @property (nonatomic, readonly) CGSize standardResolutionImageFrameSize;
//    
//    @property (nonatomic, readonly) BOOL isVideo;

    var createdDate = NSDate()
    var caption = ""
    var standardResolutionImageURL = NSURL()
    var standardResolutionImageFrameSize = CGSizeZero
    var user = ""

    init(instagramMedia: InstagramMedia) {
        createdDate = instagramMedia.createdDate;
        caption = instagramMedia.caption.text ?? ""
        standardResolutionImageURL = instagramMedia.standardResolutionImageURL
        standardResolutionImageFrameSize = instagramMedia.standardResolutionImageFrameSize
        user = instagramMedia.user.username
    }

    var description: String {
        return "\(self.dynamicType) \ndate: \(createdDate) \ncaption: \(caption) \nimageURL: \(NSStringFromCGSize(standardResolutionImageFrameSize)) \(standardResolutionImageURL)"
    }
}
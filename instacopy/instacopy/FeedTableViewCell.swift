//
//  FeedTableViewCell.swift
//  instacopy
//
//  Created by Garrett Richards on 10/24/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.layer.masksToBounds = true
    }

    func update(model: FeedPostModel) {
        postImageView.sd_setImageWithURL(model.standardResolutionImageURL)
        captionLabel.attributedText = FeedTableViewCell.attributedLabelFromCaption(model)
    }

    class func attributedLabelFromCaption(model: FeedPostModel) -> NSAttributedString {
        let captionFont = TypographyType.Caption.font()
        let userFont = TypographyType.User.font()
        let usernameAttribs = [NSForegroundColorAttributeName: UIColor.blueColor(), NSFontAttributeName: userFont]
        let captionAttribs = [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: captionFont]

        let caption: NSMutableAttributedString = NSMutableAttributedString(string: model.user + " ", attributes: usernameAttribs)
        caption.appendAttributedString(NSAttributedString(string: " " + model.caption, attributes: captionAttribs))

        return caption
    }

    class func measuredHeightOfCaption(model: FeedPostModel, maxWidth: CGFloat) -> CGFloat {
        let caption = FeedTableViewCell.attributedLabelFromCaption(model)
        let options: NSStringDrawingOptions = [.UsesLineFragmentOrigin, .UsesFontLeading]
        let size = caption.boundingRectWithSize(CGSizeMake(maxWidth, CGFloat.max), options: options, context: nil)
        return ceil(size.size.height)
    }

    class func marginSize() -> CGFloat {
        return 20
    }

}

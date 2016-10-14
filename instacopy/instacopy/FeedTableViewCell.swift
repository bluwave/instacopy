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
    @IBOutlet weak var commentContainer: UIView!
    @IBOutlet weak var commentContainerHeightConstraint: NSLayoutConstraint!

    static let usernameAttribs = [NSForegroundColorAttributeName: UIColor.blue, NSFontAttributeName: TypographyType.user.font()]
    static let captionAttribs = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: TypographyType.caption.font()]

    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.layer.masksToBounds = true
    }

    func update(_ model: FeedPostModel, maxWidth: CGFloat) {
        postImageView.sd_setImage(with: model.standardResolutionImageURL as URL!)
        captionLabel.attributedText = type(of: self).attributedLabelFromUserComment(model.user, userComment: model.caption)
        updateComments(model, maxWidth: maxWidth)
    }

    fileprivate func updateComments(_ model: FeedPostModel, maxWidth: CGFloat) {
        commentContainer.subviews.forEach { $0.removeFromSuperview() }
        var previousView: UIView?
        for (_,comment) in model.comments.enumerated() {
            let attributedComment = type(of: self).attributedLabelFromUserComment(comment.user, userComment: comment.text)
            let commentLabel = UILabel()
            commentLabel.numberOfLines = 0
            commentLabel.attributedText = attributedComment
            commentContainer.addSubview(commentLabel)
            _ = commentLabel.pinToLeftAndRightOfSuperView()
            var vfl = "V:"
            var metrics = [String: AnyObject]()
            var connectingViews = [String: UIView]()
            if let previous = previousView {
                vfl += "[previous]"
                connectingViews["previous"] = previous
            } else {
                vfl += "|"
            }

            vfl += "-(padding)-[view(h)]"
            metrics["h"] = type(of: self).measuredHeightOfAttributedString(attributedComment, maxWidth: maxWidth) as AnyObject?
            metrics["padding"] = type(of: self).padBetweenComments() as AnyObject?

            _ = commentLabel.addConstraintsWithVFL(vfl, connectingViews: connectingViews, metrics: metrics)
            previousView = commentLabel
        }
    }

    fileprivate class func attributedLabelFromUserComment(_ user: String, userComment: String) -> NSAttributedString {
        let comment: NSMutableAttributedString = NSMutableAttributedString(string: user + "  ", attributes: usernameAttribs)
        comment.append(NSAttributedString(string: userComment, attributes: captionAttribs))
        return comment
    }

    class func measuredHeightOfAttributedString(_ attributedString:NSAttributedString, maxWidth: CGFloat) -> CGFloat {
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let size = attributedString.boundingRect(with: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude), options: options, context: nil)
        return ceil(size.size.height)
    }

    class func measuredHeightOfCell(_ model: FeedPostModel, imageHeight: CGFloat, maxWidth: CGFloat) -> CGFloat {
        let caption = FeedTableViewCell.attributedLabelFromUserComment(model.user, userComment: model.caption)

        var comments = [caption]
        for comment in model.comments {
            let attributedComment = FeedTableViewCell.attributedLabelFromUserComment(comment.user, userComment:comment.text)
            comments.append(attributedComment)
        }

        var height = imageHeight + marginSize()
        for string in comments {
            height += FeedTableViewCell.padBetweenComments() + FeedTableViewCell.measuredHeightOfAttributedString(string, maxWidth: maxWidth)
        }

        height += marginSize()
        return height
    }

    class func padBetweenComments() -> CGFloat {
        return 10
    }

    class func marginSize() -> CGFloat {
        return 20
    }


}

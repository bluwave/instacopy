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

    static let usernameAttribs = [NSForegroundColorAttributeName: UIColor.blueColor(), NSFontAttributeName: TypographyType.User.font()]
    static let captionAttribs = [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: TypographyType.Caption.font()]

    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.layer.masksToBounds = true
    }

    func update(model: FeedPostModel, maxWidth: CGFloat) {
        postImageView.sd_setImageWithURL(model.standardResolutionImageURL)
        captionLabel.attributedText = self.dynamicType.attributedLabelFromUserComment(model.user, userComment: model.caption)
        updateComments(model, maxWidth: maxWidth)
    }

    private func updateComments(model: FeedPostModel, maxWidth: CGFloat) {
        commentContainer.subviews.map { $0.removeFromSuperview() }
        var previousView: UIView?
        for (index,comment) in model.comments.enumerate() {
            let attributedComment = self.dynamicType.attributedLabelFromUserComment(comment.user, userComment: comment.text)
            let commentLabel = UILabel()
            commentLabel.numberOfLines = 0
            commentLabel.attributedText = attributedComment
            commentContainer.addSubview(commentLabel)
            commentLabel.pinToLeftAndRightOfSuperView()
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
            metrics["h"] = self.dynamicType.measuredHeightOfAttributedString(attributedComment, maxWidth: maxWidth)
            metrics["padding"] = self.dynamicType.padBetweenComments()

            commentLabel.addConstraintsWithVFL(vfl, connectingViews: connectingViews, metrics: metrics)
            previousView = commentLabel
        }
    }

    private class func attributedLabelFromUserComment(user: String, userComment: String) -> NSAttributedString {
        let comment: NSMutableAttributedString = NSMutableAttributedString(string: user + "  ", attributes: usernameAttribs)
        comment.appendAttributedString(NSAttributedString(string: userComment, attributes: captionAttribs))
        return comment
    }

    class func measuredHeightOfAttributedString(attributedString:NSAttributedString, maxWidth: CGFloat) -> CGFloat {
        let options: NSStringDrawingOptions = [.UsesLineFragmentOrigin, .UsesFontLeading]
        let size = attributedString.boundingRectWithSize(CGSizeMake(maxWidth, CGFloat.max), options: options, context: nil)
        return ceil(size.size.height)
    }

    class func measuredHeightOfCell(model: FeedPostModel, imageHeight: CGFloat, maxWidth: CGFloat) -> CGFloat {
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

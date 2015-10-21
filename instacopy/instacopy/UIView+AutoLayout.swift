//
//  UIView+Extensions.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

public typealias LayoutConstraints = [NSLayoutConstraint]?

func +<T>(lhs: Array<T>?, rhs: Array<T>?) -> Array<T>? {
    switch (lhs, rhs) {
        
    case (nil, nil):
        return nil
        
    case (nil, _ ):
        return rhs
        
    case (_, nil):
        return lhs
        
    default:
        return lhs! + rhs!
    }
}

extension UIView {

    public func addConstraintsWithVFL(VFL: String, metrics: [String:AnyObject]?) -> LayoutConstraints {
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            let views = ["view": self, "superview": superview]
            let constraints = NSLayoutConstraint.constraintsWithVisualFormat(VFL, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
            superview.addConstraints(constraints)
            return constraints
        } else {
            return nil
        }
    }

    public func pinToLeftAndRightOfSuperView() -> LayoutConstraints {
        return addConstraintsWithVFL("H:|[view(==superview)]|", metrics: nil)
    }

    public func pinToTopAndBottomOfSuperView() -> LayoutConstraints {
        return addConstraintsWithVFL("V:|[view(==superview)]|", metrics: nil)
    }

    public func pinToAllSidesOfSuperView() -> LayoutConstraints {
        let horizontalConstraints = pinToLeftAndRightOfSuperView()
        let verticalConstraints = pinToTopAndBottomOfSuperView()
        return horizontalConstraints  + verticalConstraints
    }

}

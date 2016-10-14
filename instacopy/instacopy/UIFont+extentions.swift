//
//  UIFont+extentions.swift
//  instacopy
//
//  Created by Garrett Richards on 10/24/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

enum TypographyType {
    case body
    case bold
    case caption
    case user

    func font() -> UIFont {
        switch self {
        default:
            let name = fontNameForType(self)
            let size = fontSizeForType(self)
            return UIFont(name: name, size: size)!
        }
    }

    func fontSizeForType(_ type: TypographyType) -> CGFloat {
        switch self {
        case .body:
            return 16.0
        case .bold:
            return 16.0
        case .caption:
            return 13.0
        case .user:
            return 13.0
        }
    }

    func fontNameForType(_ type: TypographyType) -> String {
        switch self {
        case .body:
            return "OpenSans"
        case .bold:
            return "OpenSans-Semibold"
        case .caption:
            return "OpenSans-Light"
        case .user:
            return "OpenSans-Semibold"
        }
    }

}

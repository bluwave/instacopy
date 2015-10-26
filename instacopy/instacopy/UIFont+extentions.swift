//
//  UIFont+extentions.swift
//  instacopy
//
//  Created by Garrett Richards on 10/24/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

enum TypographyType {
    case Body
    case Bold
    case Caption
    case User

    func font() -> UIFont {
        switch self {
        default:
            let name = fontNameForType(self)
            let size = fontSizeForType(self)
            return UIFont(name: name, size: size)!
        }
    }

    func fontSizeForType(type: TypographyType) -> CGFloat {
        switch self {
        case .Body:
            return 16.0
        case .Bold:
            return 16.0
        case .Caption:
            return 13.0
        case .User:
            return 13.0
        }
    }

    func fontNameForType(type: TypographyType) -> String {
        switch self {
        case .Body:
            return "OpenSans"
        case .Bold:
            return "OpenSans-Semibold"
        case .Caption:
            return "OpenSans-Light"
        case .User:
            return "OpenSans-Semibold"
        }
    }

}
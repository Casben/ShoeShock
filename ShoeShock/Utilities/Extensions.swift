//
//  Extensions.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit

extension CGFloat {
    static func randomNumber() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .randomNumber(), green: .randomNumber(), blue: .randomNumber(), alpha: 0.20)
    }
}

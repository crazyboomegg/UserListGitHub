//
//  UIColor.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let rColor = Int(color >> 16) & mask
        let gColor = Int(color >> 8) & mask
        let bColor = Int(color) & mask
        let red   = CGFloat(rColor) / 255.0
        let green = CGFloat(gColor) / 255.0
        let blue  = CGFloat(bColor) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

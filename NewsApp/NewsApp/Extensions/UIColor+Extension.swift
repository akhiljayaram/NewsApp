//
//  UIColor+Extension.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
 extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct AppColor {
        static let primary = UIColor(netHex: 0x0091FF)
        static let highlight = UIColor(netHex: 0xF7FBFF)
        static let primaryDark = UIColor(netHex: 0x1F4479)
        static let accent = UIColor(netHex: 0x00FF00)
        static let accentSec = UIColor(netHex: 0xF1751D)
        static let accentThird = UIColor(netHex: 0xFF5F82)
        static let darkGray = UIColor(netHex: 0x484848)
        static let lightGray = UIColor(netHex: 0xDEDEDE)
        static let mediumGray = UIColor(netHex: 0x848484)
        static let gray = UIColor(netHex: 0x95989A)
        static let white = UIColor.white
        static let black = UIColor.black
        static let clear = UIColor.clear
        static let textFieldBg = UIColor(netHex: 0xF7FBFF)
        static let lightRed = UIColor(netHex: 0xFF5F82)
        static let primaryLigtGray = UIColor(netHex: 0x3B3B3B)
        static let trackBackGround = UIColor(netHex: 0xDADBDC)
        static let progressColor = UIColor(netHex: 0x95FF95)
    }
}

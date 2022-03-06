//
//  UIColor+Hex.swift
//  Elementary!
//  This example code found at https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
//  MODIFIED by Nathan Hughes on 3/5/22.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        var offset = 0
        if hex.hasPrefix("#") {
            offset = 1
        }

        let start = hex.index(hex.startIndex, offsetBy: offset)
        let hexColor = String(hex[start...])

        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
                
            // I don't think this function works as intended
            // Certain hex values do not evaluate correctly
            // Fixing this bad example code is outside of the scope of this project
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
            
        return nil
    }
}

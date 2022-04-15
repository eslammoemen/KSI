//
//  UIcolor+Ex.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/7/21.
//

import Foundation

//extension NSObject {
//    var className: String {
//        return String(describing: type(of: self))
//    }
//
//    class var className: String {
//        return String(describing: self)
//    }
//}
 import UIKit

public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, opacity:alpha)
    }
    
    convenience init(hexString: String) {
        var hexValue: CUnsignedInt = 0
        let scanner = Scanner(string: hexString)
        scanner.scanHexInt32(&hexValue)
        let value = Int(hexValue)
        self.init(red:(value >> 16) & 0xff, green:(value >> 8) & 0xff, blue:value & 0xff)
    }
    
}

extension UIColor {
    open class var AccentColor:UIColor{
        return UIColor(named: "AccentColor")!
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }

}

extension UIColor {
  static let themeColor1 = UIColor(red: 87, green: 203, blue: 169)
    static let themeColor2 = UIColor(red: 67, green: 149, blue: 187)
}




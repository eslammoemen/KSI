//
//  UIFont+Ex.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/16/21.
//

import Foundation

extension UIFont{
    open class func Alamari(ofSize fontSize: CGFloat) -> UIFont{
        
        return UIFont(name:"Almarai-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    open class func JF_Flat(ofSize fontSize: CGFloat) -> UIFont{
        
        return UIFont(name:"JF-Flat-regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    open class func CoconNextArabic_Light(ofSize fontSize: CGFloat) -> UIFont{
        return UIFont(name:"CoconNextArabic-LighT", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    open class func Din_Alternate_Bold(ofSize fontSize: CGFloat) -> UIFont{
        
        return UIFont(name:"DINNextLTArabic-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    
}


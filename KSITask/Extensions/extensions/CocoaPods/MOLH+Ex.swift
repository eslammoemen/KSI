//
//  MOLH+Ex.swift
//  zbaeh
//
//  Created by Eslam Mohamed on 12/19/21.
//

import Foundation


extension MOLH {
   open class var AppLanguageIsArabic:Bool{if MOLHLanguage.currentAppleLanguage() == "ar" {return true}else {return false}}
    open class var AppLanguage:String{return MOLHLanguage.currentAppleLanguage()}
}

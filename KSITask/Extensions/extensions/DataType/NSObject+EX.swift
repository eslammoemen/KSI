//
//  NSObject+EX.swift
//  Phyiso
//
//  Created by Eslam Mohamed on 2/25/22.
//

import Foundation
extension NSObject {
   public static var className:String {
       return String(describing: self)
    }
}

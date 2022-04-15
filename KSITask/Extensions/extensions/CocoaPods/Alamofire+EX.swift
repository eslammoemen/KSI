//
//  Alamofire+EX.swift
//  shawfna
//
//  Created by Eslam Mohamed on 3/15/22.
//

import Foundation


extension HTTPHeader {
    public static func lang(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "lang", value: value)
    }
}

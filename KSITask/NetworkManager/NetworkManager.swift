//
//  NetworkManager.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import Foundation
import Alamofire

public class NetworkManager {
    func Call<T:Decodable>(url:String,method:HTTPMethod = .get,parameters:[String : Any]? = nil,headers:HTTPHeaders? = nil,completion: @escaping (_ response:T?)->(),validationError:((_ value:Any?)->())? = nil, failure : ((_ error : Error?)->())? = nil)  {}
}

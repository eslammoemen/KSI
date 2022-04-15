//
//  APICaller.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class APICaller: NetworkManager {
    
    private var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    override  func Call<T:Decodable>(url:String,method:HTTPMethod = .get,parameters:[String : Any]? = nil,headers:HTTPHeaders? = nil,completion: @escaping (_ response:T?)->(),validationError:((_ value:Any?)->())? = nil, failure : ((_ error : Error?)->())? = nil){
        if !isConnectedToInternet {
            print("isNOTConnectedToInternet")
            return
        }
        AF.request(url, method:method, parameters:parameters, headers:headers).validate(statusCode: 200..<600).responseDecodable(of: T.self) { response in
             //print(response.request?.url?.description)
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let user = try JSONDecoder().decode(T.self, from: data)
                        try completion(user)
                        validationError?(nil)
                    }catch {
                        failure?(error)
                        //completion(nil)
                    }
                    //
                    validationError?(JSON(response.value!))
                    
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}



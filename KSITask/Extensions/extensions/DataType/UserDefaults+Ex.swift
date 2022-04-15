//
//  UserDefaults+Ex.swift
//  zbaeh
//
//  Created by Eslam Mohamed on 12/19/21.
//

import Foundation

extension UserDefaults {
    open class var DeletePresistentData:Void{
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
    open class func sattleUser<T:Codable>(with:T)->T? {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(with), forKey:"$$userDAtA$$$")
    
     if let data = UserDefaults.standard.value(forKey:"$$userDAtA$$$") as? Data{
         let model = try? PropertyListDecoder().decode(T.self, from: data)
         return model
         
     }else{  print("SAVE USER DATA ERROR") ;return nil }
     
     
     }
    open class func hookUser<T:Codable>(with:T.Type)->T? {
        if let data = UserDefaults.standard.value(forKey:"$$userDAtA$$$") as? Data{
            let model = try? PropertyListDecoder().decode(T.self, from: data)
            return model
             
        }
        
        return nil
    }
    
}

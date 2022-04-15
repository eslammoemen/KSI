//
//  Double+EX.swift
//  zbaeh
//
//  Created by Motaweron on 10/01/2022.
//

import Foundation

extension Double {
    func truncate(places : Int?)-> Double {
        if let place = places {
        return Double(floor(pow(10.0, Double(place)) * self)/pow(10.0, Double(place)))
        }else{
            return 0.0
        }
    }
}

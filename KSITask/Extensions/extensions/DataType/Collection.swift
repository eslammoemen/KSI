//
//  Collection.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/18/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index)->Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array where Element: Equatable {
    
    mutating func remove(element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
}





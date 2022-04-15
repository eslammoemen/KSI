//
//  KeyboardExtension.swift
//  Phyiso
//
//  Created by Haggag on 15/12/2021.
//

import Foundation
import UIKit
extension UIViewController {
    func inintKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dimisskeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dimisskeyboard() {
        view.endEditing(true)
    }
}

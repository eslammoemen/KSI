//
//  CustomTF.swift
//  Phyiso
//
//  Created by Haggag on 13/12/2021.
//

import UIKit
class CustomTF:UITextField {
    override func awakeFromNib() {
        self.layer.cornerRadius = 15.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.masksToBounds = true
        super.awakeFromNib()
    }
}

class RoundedView:UIView {
    override func awakeFromNib() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        self.layer.cornerRadius = 15.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.masksToBounds = true
        super.awakeFromNib()
    }}

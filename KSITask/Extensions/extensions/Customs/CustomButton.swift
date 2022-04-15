//
//  CustomButton.swift
//  Phyiso
//
//  Created by Haggag on 13/12/2021.
//

import UIKit

class CustomButton: UIButton {

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.borderWidth = 1.0
    layer.borderColor = tintColor.cgColor
    layer.cornerRadius = 20
    clipsToBounds = true
}
}

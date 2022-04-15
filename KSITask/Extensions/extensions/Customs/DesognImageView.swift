//
//  DesognImageview.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/12/21.
//

import Foundation

class DesignImageView:UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height/2
    }
}

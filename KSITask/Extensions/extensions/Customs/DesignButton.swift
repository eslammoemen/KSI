//
//  DesignButton.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/12/21.
//

import Foundation

class DesignButton:UIButton {
    

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height/2
    }
}

@IBDesignable class cornerWithoutshadow:UIButton{
    
    override func layoutSubviews(){
        layer.cornerRadius = frame.height / 2
        
    }

}
@IBDesignable class cornerWithshadow:UIButton{
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius:frame.height/2).cgPath
    }
}

//
//  DesignView.swift
//  tripperonline
//
//  Created by Mohamed Macbook on 4/7/20.
//  Copyright © 2020 MohamedMazin. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class DesignView:UIView{


    @IBInspectable var cornerRadius:CGFloat=0
    @IBInspectable var shadowColor:UIColor?=UIColor.black
    @IBInspectable var shadowOffsetWidth:Int=0
    @IBInspectable var shadowOffsetHeight:Int=1
    @IBInspectable var shadowOpsity:Float=0.2
    @IBInspectable var borderWidth:CGFloat=1
    @IBInspectable var borderColor:UIColor?=UIColor.black
    @IBInspectable var isBorder:Bool=false


    override func layoutSubviews() {
        layer.cornerRadius=cornerRadius
        layer.shadowColor=shadowColor?.cgColor
        layer.shadowOffset=CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath=UIBezierPath(roundedRect: bounds, cornerRadius:  cornerRadius)
        layer.shadowPath=shadowPath.cgPath
        layer.shadowOpacity=shadowOpsity
        if isBorder == true{
            layer.borderWidth=borderWidth
            layer.borderColor=borderColor?.cgColor
        }
    }

}
@IBDesignable class cornerWithoutShadow:UIView{
    
    override func layoutSubviews(){
        layer.cornerRadius = frame.height / 2
        
    }

}
@IBDesignable class cornerWithShadow:UIView{
    override func layoutSubviews() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius:frame.height/2).cgPath
    }
}
class DropShadow:UIView{
    
        @IBInspectable var cornerRadius:CGFloat=0

    
    override func layoutSubviews(){
        layer.cornerRadius=cornerRadius
            layer.masksToBounds = false
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 1)
            //layer.shadowRadius = 1
        

        layer.shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius:cornerRadius).cgPath
            //layer.shouldRasterize = true
            //layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}
class Dropshadow:UIButton{
    
        @IBInspectable var cornerRadius:CGFloat=0

    
    override func layoutSubviews(){
        layer.cornerRadius=cornerRadius
            layer.masksToBounds = false
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 1)
            //layer.shadowRadius = 1
        

        layer.shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius:cornerRadius).cgPath
            //layer.shouldRasterize = true
            //layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}





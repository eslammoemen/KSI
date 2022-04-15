//
//  BottomShadow.swift
//  zbaeh
//
//  Created by Motaweron on 03/01/2022.
//

import Foundation

@IBDesignable class BottomShadow: UIView {

    @IBInspectable var shadowHeight: CGFloat = 5
    
    override func layoutSubviews() {
        
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: self.bounds.height))
        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height + shadowHeight))
        shadowPath.addLine(to: CGPoint(x: 0, y: self.bounds.height + shadowHeight))
        shadowPath.close()

        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowRadius = 2
//        self.layer.cornerRadius =
        
    }
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//            let shadowPath = UIBezierPath()
//            shadowPath.move(to: CGPoint(x: 0, y: self.bounds.height))
//            shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
//            shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height + shadowHeight))
//            shadowPath.addLine(to: CGPoint(x: 0, y: self.bounds.height + shadowHeight))
//            shadowPath.close()
//
//            self.layer.shadowColor = UIColor.black.cgColor
//            self.layer.shadowOpacity = 0.2
//            self.layer.masksToBounds = false
//            self.layer.shadowPath = shadowPath.cgPath
//            self.layer.shadowRadius = 2
//    }
    
}

//
//  UIButton+Ex.swift
//  Sokyakom
//
//  Created by Ghoost on 9/21/20.
//

import UIKit

extension UIButton {
    
    func springAnimate() {
        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    func initButton(title:String,titleColor :UIColor , backgroundColor:UIColor,roundValue :CGFloat, fontSize:CGFloat , borderColor:UIColor = UIColor.clear , borderWidth :CGFloat = 0)
    {
        self.setTitle(title.localized(), for: .normal)
        self.titleLabel?.font = .JF_Flat(ofSize: 17)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = roundValue
        self.clipsToBounds = true
        
    }
    
    func centerTextAndImage(spacing: CGFloat) {
          let insetAmount = spacing / 2
          let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
          let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1

          self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
          self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
          self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
      }
    
    enum ImageTitleRelativeLocation {
       case imageUpTitleDown
       case imageDownTitleUp
       case imageLeftTitleRight
       case imageRightTitleLeft
   }
    
    func centerContentRelativeLocation(_ relativeLocation:
                                          ImageTitleRelativeLocation,
                                       spacing: CGFloat = 0) {
        assert(contentVerticalAlignment == .center,
               "only works with contentVerticalAlignment = .center !!!")

        guard (title(for: .normal) != nil) || (attributedTitle(for: .normal) != nil) else {
            assert(false, "TITLE IS NIL! SET TITTLE FIRST!")
            return
        }

        guard let imageSize = self.currentImage?.size else {
            assert(false, "IMGAGE IS NIL! SET IMAGE FIRST!!!")
            return
        }
        guard let titleSize = titleLabel?
            .systemLayoutSizeFitting(UIView.layoutFittingCompressedSize) else {
                assert(false, "TITLELABEL IS NIL!")
                return
        }

        let horizontalResistent: CGFloat
        // extend contenArea in case of title is shrink
        if frame.width < titleSize.width + imageSize.width {
            horizontalResistent = titleSize.width + imageSize.width - frame.width
            print("horizontalResistent", horizontalResistent)
        } else {
            horizontalResistent = 0
        }

        var adjustImageEdgeInsets: UIEdgeInsets = .zero
        var adjustTitleEdgeInsets: UIEdgeInsets = .zero
        var adjustContentEdgeInsets: UIEdgeInsets = .zero

        let verticalImageAbsOffset = abs((titleSize.height + spacing) / 2)
        let verticalTitleAbsOffset = abs((imageSize.height + spacing) / 2)

        switch relativeLocation {
        case .imageUpTitleDown:

            adjustImageEdgeInsets.top = -verticalImageAbsOffset
            adjustImageEdgeInsets.bottom = verticalImageAbsOffset
            adjustImageEdgeInsets.left = titleSize.width / 2 + horizontalResistent / 2
            adjustImageEdgeInsets.right = -titleSize.width / 2 - horizontalResistent / 2

            adjustTitleEdgeInsets.top = verticalTitleAbsOffset
            adjustTitleEdgeInsets.bottom = -verticalTitleAbsOffset
            adjustTitleEdgeInsets.left = -imageSize.width / 2 + horizontalResistent / 2
            adjustTitleEdgeInsets.right = imageSize.width / 2 - horizontalResistent / 2

            adjustContentEdgeInsets.top = spacing
            adjustContentEdgeInsets.bottom = spacing
            adjustContentEdgeInsets.left = -horizontalResistent
            adjustContentEdgeInsets.right = -horizontalResistent
        case .imageDownTitleUp:
            adjustImageEdgeInsets.top = verticalImageAbsOffset
            adjustImageEdgeInsets.bottom = -verticalImageAbsOffset
            adjustImageEdgeInsets.left = titleSize.width / 2 + horizontalResistent / 2
            adjustImageEdgeInsets.right = -titleSize.width / 2 - horizontalResistent / 2

            adjustTitleEdgeInsets.top = -verticalTitleAbsOffset
            adjustTitleEdgeInsets.bottom = verticalTitleAbsOffset
            adjustTitleEdgeInsets.left = -imageSize.width / 2 + horizontalResistent / 2
            adjustTitleEdgeInsets.right = imageSize.width / 2 - horizontalResistent / 2

            adjustContentEdgeInsets.top = spacing
            adjustContentEdgeInsets.bottom = spacing
            adjustContentEdgeInsets.left = -horizontalResistent
            adjustContentEdgeInsets.right = -horizontalResistent
        case .imageLeftTitleRight:
            adjustImageEdgeInsets.left = -spacing / 2
            adjustImageEdgeInsets.right = spacing / 2

            adjustTitleEdgeInsets.left = spacing / 2
            adjustTitleEdgeInsets.right = -spacing / 2

            adjustContentEdgeInsets.left = spacing
            adjustContentEdgeInsets.right = spacing
        case .imageRightTitleLeft:
            adjustImageEdgeInsets.left = titleSize.width + spacing / 2
            adjustImageEdgeInsets.right = -titleSize.width - spacing / 2

            adjustTitleEdgeInsets.left = -imageSize.width - spacing / 2
            adjustTitleEdgeInsets.right = imageSize.width + spacing / 2

            adjustContentEdgeInsets.left = spacing
            adjustContentEdgeInsets.right = spacing
        }

        imageEdgeInsets = adjustImageEdgeInsets
        titleEdgeInsets = adjustTitleEdgeInsets
        contentEdgeInsets = adjustContentEdgeInsets

        setNeedsLayout()
    }
    
    
}

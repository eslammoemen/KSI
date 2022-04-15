//
//  UIImageView+Ex.swift
//  Sokyakom
//
//  Created by Ghoost on 10/15/20.
//

import UIKit
import MOLH
import Kingfisher

extension UIImageView {
    func setImage(from url:String?) {
        let UrlString = url?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = UrlString, !url.isEmpty else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with:URL(string:url),placeholder: UIImage(named: "contactBg"),options: [.transition(ImageTransition.fade(0.5))])
      }

    
}
extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}

extension UIViewController {
    func getImage(from:String)->UIImage?{
    let url = URL(string:from)
    let data = try? Data(contentsOf: url!)
    return UIImage(data: data!)
    }
}

 func downloadImageWithUrl(_ url:String,completion:@escaping (UIImage)->()){
  ImageDownloader.default.downloadImage(with:URL(string:url)!, options: nil) { (imageRes) in
    switch imageRes {
        case .success(let val):
            completion(val.image)
        case .failure(_):
               break
    }}
}
extension UIImageView {
    func FlipImage(){
        if MOLH.AppLanguageIsArabic {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }else{
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

extension UIImage {

    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    

    func resize(scaledToWidth desiredWidth: CGFloat) -> UIImage {
        let oldWidth = size.width
        let scaleFactor = desiredWidth / oldWidth

        let newHeight = size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)

        return resize(targetSize: newSize)
    }

    func resize(scaledToHeight desiredHeight: CGFloat) -> UIImage {
        let scaleFactor = desiredHeight / size.height
        let newWidth = size.width * scaleFactor
        let newSize = CGSize(width: newWidth, height: desiredHeight)

        return resize(targetSize: newSize)
    }

}
extension UIImage {
       // image with rounded corners
       public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
           let maxRadius = min(size.width, size.height) / 2
           let cornerRadius: CGFloat
           if let radius = radius, radius > 0 && radius <= maxRadius {
               cornerRadius = radius
           } else {
               cornerRadius = maxRadius
           }
           UIGraphicsBeginImageContextWithOptions(size, false, scale)
           let rect = CGRect(origin: .zero, size: size)
           UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
           draw(in: rect)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image
       }
   }
extension UIImage {
     func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}



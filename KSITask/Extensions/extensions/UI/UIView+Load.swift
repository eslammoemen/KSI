////
////  UIView+Load.swift
////  weeding
////
////  Created by Eslam Mohamed on 12/7/21.
////
//
//
//


extension UIView{
    var showCompeletionError:Void{
        let imageView = UIImageView()
        imageView.tag = 999
        self.addSubview(imageView)
        
        imageView.image = UIImage(named:"infoError")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        
    }
    var hideError:Void{
        
            if let viewWithTag = self.viewWithTag(999) {
                viewWithTag.removeFromSuperview()
            }else{
                print("No!")
            }
    }
    
}

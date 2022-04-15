//
//  itemsCell.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import UIKit

class itemsCell: UITableViewCell {

    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
    }
    var bannerConfigs:BannerModel? {
        didSet {
            if bannerConfigs?.type == .productsCover   {
                backGroundImage.alpha = 1
                backGroundImage.setImage(from: bannerConfigs?.content?.backgroundImage)
                titleLable.textAlignment = .center
                titleLable.textColor = .white
                titleLable.isHidden = false
            }else if bannerConfigs?.type == .main {
                titleLable.isHidden = true
                backGroundImage.alpha = 1
                backGroundImage.setImage(from: bannerConfigs?.content?.backgroundImage)
            }else if bannerConfigs?.type == .categoryCover {
                titleLable.isHidden = true
                backGroundImage.alpha = 1
                backGroundImage.setImage(from: bannerConfigs?.content?.backgroundImage)
                
            }else{
                titleLable.isHidden = false
                backGroundImage.alpha = 0
                if MOLH.AppLanguageIsArabic {
                    titleLable.textAlignment = .right
                }else{
                    titleLable.textAlignment = .left
                }
                
                titleLable.textColor = .black

            }
            titleLable.text = bannerConfigs?.content?.heading
        }
    }
    
 
    
}

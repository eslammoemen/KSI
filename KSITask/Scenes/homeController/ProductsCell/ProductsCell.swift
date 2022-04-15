//
//  ProductsCell.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import UIKit

class ProductsCell: UICollectionViewCell {

    @IBOutlet weak var badge: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var discountValue: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var Atitle: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var NewPrice: UILabel!
    @IBOutlet weak var saleStack: UIStackView!
    @IBOutlet weak var stickView: UIView!
    //
    @IBOutlet weak var brandsView: UIView!
    @IBOutlet weak var mainBrandImage: UIImageView!
    @IBOutlet weak var brandTitle: UILabel!
    @IBOutlet weak var imageLeading: NSLayoutConstraint!
    
    
    @IBOutlet weak var badgeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        [backView,brandsView].forEach {
            $0?.layer.cornerRadius = 2
            $0?.layer.borderWidth = 0.4
            $0?.layer.borderColor = UIColor.lightGray.cgColor
        }
        backView.layer.cornerRadius = 2
        backView.layer.borderWidth = 0.4
        backView.layer.borderColor = UIColor.lightGray.cgColor
        addToCart.layer.borderWidth = 1.5
        addToCart.layer.borderColor = UIColor(hexString:"E75D24").cgColor
    }
    var blockConfigs:Block?{
        didSet{
            brandTitle.text = blockConfigs?.title
            mainBrandImage.setImage(from: blockConfigs?.blockImage)
            
        }
    }
    var brandConfigs:Brand? {
        didSet{
            mainBrandImage.setImage(from: brandConfigs?.image)

        }
    }
    var categoryCover:Block?{
        didSet {
            mainBrandImage.setImage(from: categoryCover?.image)
            mainBrandImage.layer.cornerRadius = mainBrandImage.frame.height/2
            brandsView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            brandsView.layer.borderWidth = 0
            imageLeading.constant = 5
            brandTitle.text = ""
            
        }
    }
    
    var productsConfigs:Product? {
        didSet{
            let productVarient = productsConfigs?.variants?[safe:0]
            
            Atitle.text = productsConfigs?.title
            ProductImage.setImage(from:productsConfigs?.image)
            categoryLabel.text = productsConfigs?.brand
            oldPrice.text = (productVarient?.price?.description ?? "0") + (productVarient?.currency ?? "")
            NewPrice.text = (productVarient?.salePrice?.description ?? "0") + (productVarient?.currency ?? "")
            discountValue.text = (productVarient?.saleAmount?.description ?? "") + "%"
            badge.text = productVarient?.badge
            if let badgeChecker = productVarient?.badge{
                if badgeChecker != "" {
                    badgeView.isHidden = false
                }else{
                    badgeView.isHidden = true
                }
            }
            
            if let salePrice = productVarient?.onSale {
                if !salePrice {
                    saleStack.isHidden = true
                    stickView.isHidden = true
                }else {
                    saleStack.isHidden = false
                    stickView.isHidden = false
                }
            }
            
            if let variants = productsConfigs?.variants?.count {
                if variants > 1 {
                    addToCart.setTitle("view options".localized(), for: .normal)
                }else{
                    addToCart.setTitle("add To Cart".localized(), for: .normal)
                }
            }
        }
    }
    

}

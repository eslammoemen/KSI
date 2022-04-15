//
//  itemsModel.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import Foundation

struct ItemsModel: Codable {
    let status: Status?
    let data: itemsModel?
}

struct itemsModel: Codable {
    let meta: Meta?
    let banners: [BannerModel]?
}

struct BannerModel: Codable {
    let type: productTypes?
    let content: BannerContent?
    
}
struct BannerContent: Codable {
    let backgroundImage: String?
    let backgroundFocusPoint, backgroundColor, heading: String?
    let id: Int?
    let blocks: [Block]?
    let products: [Product]?
    let brands: [Brand]?
    
}
struct Block: Codable {
    let type: String?
    let id: Int?
    let image: String?
    let title: String?
    let blockImage: String?
    let blockBackgroundColor, textColor: String?
    let content: BlockContent?
}

struct BlockContent: Codable {
    let heading, type: String?
    let id: Int?
    let products: [Product]?
}
struct Product: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let brand: String?
    let rating: Double?
    let variants: [Variant]?
}
struct VariantContent: Codable {
    let heading: String?
    let textColor: String?
    let backgroundImage: String?
    let products: [FluffyProduct]?
}
struct FluffyProduct: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let brand: String?
    let rating: Double?
    let variants: [Variant]?
    let type: String?
    let content: ProductContent?
}

struct Variant: Codable {
    let id: Int?
    let isDefault, hasStock: Bool?
    let stock: Int?
    let unlimitedStock: Bool?
    let minQty, maxQty, weight: Int?
    let dateAdded: String?
    let onSale: Bool?
    let currency: String?
    let price, salePrice, saleAmount: Double?
    let saleType: String?
    let bestSeller: Bool?
    let badge: String?
    let badgeTextColor: String?
    let badgeBackground: String?
    let type: String?
    let content: VariantContent?
}

struct ProductContent: Codable {
    let heading: String?
    let brands: [Brand]?
}

struct Brand: Codable {
    let id: Int?
    let image: String?
    let category: Int?
}

enum productTypes: Codable {
    func encode(to encoder: Encoder) throws {
        
    }
    
    case productsCover
    case categoryProductsSlider
    case brandsSlider
    case categoryCover
    case main
    case other
    
    init(from decoder: Decoder) throws {
        let data = try decoder.singleValueContainer().decode(String.self)
        switch data {
        case "categoryCover":self = .categoryCover
        case "productsCover": self = .productsCover
        case "categoryProductsSlider": self = .categoryProductsSlider
        case "brandsSlider": self = .brandsSlider
        case "main": self = .main
            
        default: self = .other
        }
    }
    
    
}






//Meta
struct Meta: Codable {
    let pageNumber, pageLimit, totalPages: Int?
}
struct Status: Codable {
    let success: Bool?
    let code: Int?
    let message, devMsg: String?
    let update: Update?
}

struct Update: Codable {
    let forceUpdate: Bool?
    let forceUpdateMessage: String?
}


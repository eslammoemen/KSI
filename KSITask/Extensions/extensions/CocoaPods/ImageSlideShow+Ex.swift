//
//  ImageSlideShow+Ex.swift
//  GoldenCoupon
//
//  Created by Eslam Mohamed on 1/21/22.
//

//import Foundation
//import ImageSlideshow
//
//final class slider{
//
//    public static func configureSlider(with sliderData:[Slider]?)->ImageSlideshow{
//        let slider = ImageSlideshow()
//        var imageSource = [ImageSource]()
//        if let sliderObjc = sliderData {
//        for element in sliderObjc{
//            if let pho = element.photo {
//                downloadImageWithUrl(pho) { image in
//                   imageSource.append(ImageSource(image:image))
//                    slider.setImageInputs(imageSource)
//                    slider.contentScaleMode = .scaleToFill
//                    slider.backgroundColor = .systemBackground
//                    slider.activityIndicator = DefaultActivityIndicator()
//                    slider.layer.cornerRadius = 15
//                    slider.clipsToBounds = true
//                    slider.slideshowInterval = 3
//                }
//            }
//
//        }
//    }
//        return slider
//    }
//}


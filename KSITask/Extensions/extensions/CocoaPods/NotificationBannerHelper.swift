//
//  NotificationBannerHelper.swift
//  MvvmRxSwiftProOne
//
//  Created by Ghoost on 9/19/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import Foundation
import NotificationBannerSwift

class NotificationBannerHelper: NSObject {
   private override init() {}
   static let shared = NotificationBannerHelper()
    
   func showWarning(title:String,subtitle: String) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "warning"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .warning)
        banner.show(
            cornerRadius: 8,
            shadowColor: UIColor(red: 0.431, green: 0.459, blue: 0.494, alpha: 1),
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        banner.dismiss()
    }}
    
    func showError(title:String,subtitle: String) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "error"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .danger)
        banner.show(
            cornerRadius: 8,
            shadowColor: .clear,
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            banner.dismiss()
        }
    }
    
    func showSuccess(title:String,subtitle: String) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "success"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .success)
        banner.show(
            cornerRadius: 8,
            shadowColor: .clear,
            //UIColor(red: 10, green: 160, blue: 110, alpha: 1),
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            banner.dismiss()
        }
    }
    
    
    
}

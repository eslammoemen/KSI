//
//  NotificationBannerHelper.swift
//  MvvmRxSwiftProOne
//
//  Created by Ghoost on 9/19/20.
//  Copyright © 2020 Khalij. All rights reserved.
//



final class  BannerKeys {
    
    public static let success = "Success".localized()
    public static let Error = "Error".localized()
    public static let Warning = "Warrning".localized()
    public static let noData = "No Data to Display!".localized()


}

import Foundation
import UIKit
class Banner: NSObject {
   private override init() {}
    
   class func showWarning(subtitle: String?) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "warning"))
       ss.tintColor = .white
    let banner = FloatingNotificationBanner(title:BannerKeys.Warning,subtitle: subtitle, leftView: ss , style: .warning)
        banner.show(
            cornerRadius: 8,
            shadowColor: UIColor(red: 0.431, green: 0.459, blue: 0.494, alpha: 1),
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        banner.dismiss()
    }}
    
    class func showError(subtitle:String?) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "error"))
        ss.tintColor = .white
        let banner = FloatingNotificationBanner(title:BannerKeys.Error,subtitle: subtitle, leftView: ss , style: .danger)
        banner.show(
            cornerRadius: 8,
            shadowColor: .clear,
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            banner.dismiss()
        }
    }
    
    class func showSuccess(subtitle: String?) {
        //ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "success"))
        ss.tintColor = .white
        let banner = FloatingNotificationBanner(title:BannerKeys.success,subtitle: subtitle, leftView: ss , style: .success)
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

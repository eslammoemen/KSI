//
//  MBProgressHUD.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/12/21.
//

import Foundation
import MBProgressHUD

extension UIView {
    
    func showHud(){
        let loadingNotification = MBProgressHUD.showAdded(to: self, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.backgroundView.blurEffectStyle = .regular
        loadingNotification.bezelView.style = .solidColor
        loadingNotification.bezelView.color = .clear
        loadingNotification.label.font = UIFont.JF_Flat(ofSize: 19)
        loadingNotification.animationType = .zoomOut
        loadingNotification.label.text = "loading".localized()
        
    }
    
    func hideHud(){
        MBProgressHUD.hide(for: self, animated: true)
    }
}

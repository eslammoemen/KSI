//
//  mainTabBar.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/6/21.
//

import UIKit
import SwiftUI



class mainTabBar: UITabBarController,UITabBarControllerDelegate{
    
    
    static var selectedIndex:Int!
    fileprivate var itemsController = Array<UIViewController>()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont.Cairo(ofSize: 15)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
       
       
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.delegate = self
        view.backgroundColor = .white


//
        
        self.selectedIndex = 0
        mainTabBar.selectedIndex = self.selectedIndex

        let item0 = UINavigationController(rootViewController:homeController(dataFetchable: APICaller()))
        item0.navigationBar.isHidden = true
        let icon0 = UITabBarItem(title: "Home".localized(), image:UIImage(systemName: "house"), tag: 0)
        
        item0.tabBarItem = icon0
        
         item0.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
           
    
        
        self.tabBar.tintColor = UIColor(hexString:"E75D24")
        self.tabBar.isTranslucent = false
        
        
        
        
        self.setViewControllers([item0], animated: true)
        
      
        
    }
    
   
    
    
    
    
}


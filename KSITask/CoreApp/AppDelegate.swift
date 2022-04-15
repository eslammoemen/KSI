//
//  AppDelegate.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBar = mainTabBar()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        MOLH.setLanguageTo("ar")
        
        return true
    }




}


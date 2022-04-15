//
//  homeControllerViewsConfig.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import Foundation
import UIKit
protocol homeViewsConfig{}
extension homeViewsConfig where Self: homeController {
    
     func itesmtableConfigurations(completion:()->()) {
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.registerNib(cell: itemsCell.self)
        itemsTableView.separatorStyle = .none
        itemsTableView.allowsSelection = false
    }
    
    
}


//
//  dropper.swift
//  just ask
//
//  Created by Eslam Mohamed on 11/9/21.
//

import UIKit
//import SideMenu

//MARK: dropper
//extension DropDown {
//    final class func drop(addView:UIView,withdatasource:[String],completion:@escaping(_ index:Int,_ item:String )->()){
//        let dropObject = DropDown()
//        dropObject.textFont = UIFont.JF_Flat(ofSize: 19)
//        //dropObject.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in cell.optionLabel.textAlignment = .center}
//
//        dropObject.width = UIScreen.main.bounds.width - 30
//        dropObject.setupCornerRadius(8)
//        //dropObject.bottomOffset = CGPoint(x: 0,y:Int(dropObject.anchorView!.plainView.bounds.height))
//        dropObject.direction = .bottom
//        dropObject.anchorView = addView
//        dropObject.dataSource = withdatasource
//        dropObject.show()
//        dropObject.selectionAction = {(index: Int, item: String) in
//            completion(index,item)
//        }
//
//
//    }
//}
//class dropper{
//    var dropObject = DropDown()
//   static var shared = dropper()
//     func drop(addView:UIView,withdatasource:[String],completion:@escaping(_ index:Int,_ item:String )->()){
//        dropObject.textFont = UIFont.JF_Flat(ofSize: 19)
//        //dropObject.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in cell.optionLabel.textAlignment = .center}
//
//        dropObject.width = UIScreen.main.bounds.width - 30
//        dropObject.setupCornerRadius(8)
//        //dropObject.bottomOffset = CGPoint(x: 0,y:Int(dropObject.anchorView!.plainView.bounds.height))
//        dropObject.direction = .bottom
//        dropObject.anchorView = addView
//        dropObject.dataSource = withdatasource
//        dropObject.show()
//        dropObject.selectionAction = {(index: Int, item: String) in
//            completion(index,item)
//        }
//    }
//
//
//}








class swifty:NSObject {
    
    class func controller(storyboard:String,with `class`:String)->UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(identifier:`class`)
        return vc
    }
//    class func sideMenu(_ storyboard:String ,_ identifier:String)->SideMenuNavigationController{
//            let menu = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier:identifier) as! SideMenuNavigationController
//            menu.menuWidth = UIScreen.main.bounds.width/2 + UIScreen.main.bounds.width/4
//            menu.presentationStyle = .menuSlideIn
//            if Locale.preferredLanguages[0] == "ar" {menu.leftSide = true}else{menu.leftSide = false}
//            return menu
//        }
//
   
    
    
    
    
   class func sattleUser<T:Codable>(with:T)->T? {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(with), forKey:"$$userDAtA$$$")
   
    if let data = UserDefaults.standard.value(forKey:"$$userDAtA$$$") as? Data{
        let model = try? PropertyListDecoder().decode(T.self, from: data)
        return model
        
    }else{ return nil }
    
    
    }
    
    
    class func hookUser<T:Codable>(compeletion:(_ Model:T?)->()){
    
    if let data = UserDefaults.standard.value(forKey:"$$userDAtA$$$") as? Data{
        let model = try? PropertyListDecoder().decode(T.self, from: data)
        compeletion(model)
        
    }else{
            compeletion(nil)
        }
          
   }
    
   
}


//MARK: open camera or pick image from galary

//MARK: error view adding & hiding
extension UIView {
   
    
}


//MARK: popover vc small pop
//class pop:NSObject {
//    var viewController: UIViewController?
//    static var shared = pop()
//
//    func popvc(_ viewControler:UIViewController,as VC:UIViewController) {
//        let popOverVC = UIStoryboard(name: "Products", bundle: nil).instantiateViewController(withIdentifier: "addSec") as! viewControler
//        self.viewController = viewControler
//
//        let popupVC = PopupViewController(contentController: popOverVC, popupWidth: UIScreen.main.bounds.width-20, popupHeight: 250)
//        popupVC.backgroundAlpha = 0.3
//        popupVC.backgroundColor = UIColor.black
//        popupVC.canTapOutsideToDismiss = true
//        popupVC.cornerRadius = 10
//        popupVC.shadowEnabled = true
//        viewControler.present(popupVC, animated: true)
//    }
//
//
//}

////  Converted to Swift 5.5 by Swiftify v5.5.21910 - https://swiftify.com/
//func viewDidLoad() {
//    let timePicker = ESTimePicker(delegate: self) // Delegate is optional
//    timePicker.frame = CGRect(x: 10, y: 100, width: 300, height: 300)
//    view.addSubview(timePicker)
//}
//
//func timePickerHoursChanged(_ timePicker: ESTimePicker?, toHours hours: Int) {
//    hoursLabel.text = String(format: "%i", hours)
//}
//
//func timePickerMinutesChanged(_ timePicker: ESTimePicker?, toMinutes minutes: Int) {
//    minutesLabel.text = String(format: "%i", minutes)
//}



//
//  CalenderFounddation+Ex.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/9/21.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
//class calender:NSObject {
//
//    class func pickDate(_ vc:UIViewController,compeletion:@escaping (_ date:Date?)->()){
//        let calendarVC = CalendarViewController(dateSelectedBlock: { date in
//
//            if let date = date {
//               compeletion(date)
//            } else {
//               compeletion(nil)
//
//            }
//        })
//
//        // From you `UIViewController` present it
//        vc.present(calendarVC, animated: true)
//    }
//}

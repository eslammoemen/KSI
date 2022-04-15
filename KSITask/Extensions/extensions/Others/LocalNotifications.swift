//
//  LocalNotifications.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/9/21.
//

import Foundation
import UserNotifications

class LocalNotification{
    class func LocalNotification(_ title:String,_ body:String,_ sound:UNNotificationSound,_ info:[String:String]){
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = sound
        content.userInfo = info
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(1))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
    }
}

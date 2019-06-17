//  Notifications.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
import UserNotifications

extension CollectionVC {
    
    func setupNotificationForStatusBarHeightChange() {
        if phones.contains(modelName) {
            let center = UNUserNotificationCenter.current()
            center.removeAllDeliveredNotifications()                //to remove all delivered notifications
            center.removeAllPendingNotificationRequests()           //to remove all pending notifications which are not delivered yet but scheduled.
            NotificationCenter.default.addObserver(self, selector: #selector(reloadCV),
                                                   name: UIApplication.willChangeStatusBarFrameNotification, object: nil)
        }
    }
}


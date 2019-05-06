//  Present&Reload.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit; import UserNotifications

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                       //print("\nshowing vc \(vc)")
        
        if currentTopVC != vc {
            
            //if currentOrientation == "landscape" {
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            //
            //} else {
            //setupAndPresent(vc: vc)
            //}
            
        } else {
            print("you're already looking at the \(vc.collectionViewType)-view")//collectionViewType
        }
    }
    
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
    
    
    @objc func reloadCV() {             //print("\n↺")
        self.collectionView.reloadData()
    }
    
    
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
// ok let's try this

//is it fast enough

//is it fast enough

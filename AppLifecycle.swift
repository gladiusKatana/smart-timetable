//  AppLifecycle.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit 
extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let str = "🔅became active"
        if firstReenteredForeground { customApplicationStatusPrint(applicationState: str)}
        else {print(str)}
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            topVC.reloadCV()
        }
        
        defaultLoad(showDate: true)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        customApplicationStatusPrint(applicationState: "⤊will resign active")
        defaultSave(showDate: true)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        customApplicationStatusPrint(applicationState: "🌘entered background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("🌔will enter foreground")//customApplicationStatusPrint(applicationState: "🌔will enter foreground")
        
        firstReenteredForeground = true // note, this bool (currently) is one-way: never flips back to false because...
    }//                                 //...calling the above 2 methods causes a layout exception over the whole life cycle
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    
    func customApplicationStatusPrint(applicationState: String) {
        print("\n\(applicationState)")
    }
}


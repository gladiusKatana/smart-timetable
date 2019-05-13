//  AppDelegate.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit 

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = navyBlue
        window?.makeKeyAndVisible()
        
        modelName = UIDevice.modelName
        getOrientationAtLaunch()                                    ; print("launching on \(modelName) ...in \(launchOrientation) orientation")
        
        statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = .clear
        }
        
        UINavigationBar.appearance().barTintColor = icyBlue
        UINavigationBar.appearance().shadowImage = UIImage()
        
        print(formattedDateString(Date(), comment: "                      ...on date", short: false))
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        backgroundVC.view.frame = globalKeyWindow.frame
        backgroundVC.view.backgroundColor = navyBlue
        
        navController = UINavigationController(rootViewController: backgroundVC)
        
        window?.rootViewController = navController                  //; print("VCs*: \(String(describing: nav Controller?.viewControllers))")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            timetableVC.setupAndPresent(vc: timetableVC)  // just need a uiviewcontroller (any of them) to call this func.
        }
        
        return true
    }
}





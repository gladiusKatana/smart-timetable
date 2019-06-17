//  SetTopVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension UIViewController {
    
    func setTopViewController() {
        
        guard let viewControllers = self.navigationController?.viewControllers else { // despite the s, should only contain 1 view controller...
//            print("...could not bind view controller array")
            return
        }
        
        //print("view controllers: \(viewControllers)")
        
        guard viewControllers.count == 1 else {
            print("\n\nnavigation controller, somehow, contains more than one view controller at once  ... \n\nvc count: \(viewControllers.count)   \n\nvcs: \(viewControllers)'\n\n")
            return
        }
        
        guard let customVC = viewControllers[0] as? CollectionVC else {
            print("...could not downcast vc")
            return
        }
        
        topVC = customVC
    }
}


//  Orientation.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension AppDelegate {
    
    func getOrientationAtLaunch() {
        
        let launchHeight = Double(globalKeyWindow.frame.height)     //; print("view frame height \(launchHeight)")
        launchWidth = Double(globalKeyWindow.frame.width)           //;  print("view frame width \(launchWidth)")
        
        if launchHeight > launchWidth {
            launchOrientation = "portrait"
            lastStatusBarHeight = 20
        }
        else if launchHeight < launchWidth {
            launchOrientation = "landscape"
            lastStatusBarHeight = 0
        }
        else {
            launchOrientation = " ?"
            lastStatusBarHeight = 99
        }
        currentOrientation = launchOrientation; previousOrientation = launchOrientation
    }
}

func checkOrientation() {
    
    let currentHeight = Double(globalKeyWindow.frame.height);   let currentWidth = Double(globalKeyWindow.frame.width)
    
    if currentHeight > currentWidth {
        currentOrientation = "portrait"
    }
    else if currentHeight < currentWidth {
        currentOrientation = "landscape"
    }
    else {print("\n\nApparently, somehow, the global key window's frame's height & width are being evaluated as equal...")} //shouldn't get called
}//                                                                                                          ...unless Apple makes a square device

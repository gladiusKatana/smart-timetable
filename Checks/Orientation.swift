//  Orientation.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension AppDelegate {
    
    func getOrientationAtLaunch() {
        
        let launchHeight = Double(globalKeyWindow.frame.height)
        launchWidth = Double(globalKeyWindow.frame.width)
        
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
        
        currentOrientation = launchOrientation
        previousOrientation = launchOrientation
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
    else {print("\n\nUm, global key window frame height & width are equal...")}//shouldn't get called... unless Apple decides to make a square device
}


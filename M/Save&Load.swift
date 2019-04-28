//  SaveUsingDefaults.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit


func saveUsingDefaults(pryntLastLogin: Bool) {
    lastLoginDateComponents = [year, monthString, dayInt, weekday, hour, minute]
    
    let defaults = UserDefaults.standard
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    
    if pryntLastLogin {
        print("saving via defaults, date logged:\n\(lastLoginDateComponents)")
    }
}


func loadUsingDefaults(showDates: Bool) {                                        //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    
    lastLoginDateComponents = defaults.array(forKey: "savedLastLoginDate") ?? ["-"]
    
    if showDates {
        print("last login: \(lastLoginDateComponents)")
        //["\(weekday)", "\(monthString) \(dayInt)", "\(year)", "\(hour):\(minute)"]
    }
}


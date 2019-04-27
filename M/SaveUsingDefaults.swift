//  SaveUsingDefaults.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func saveUsingDefaults(pryntLastLogin: Bool) {
    lastLoginDateStrings = ["\(weekday)", "\(monthString) \(dayInt)", "\(year)", "\(hour):\(minute)"]
    
    let defaults = UserDefaults.standard
    defaults.set(lastLoginDateStrings, forKey: "savedLastLoginDateString")
    
    if pryntLastLogin {
        print("saving via defaults, date logged:\n\(lastLoginDateStrings)")
    }
}

func loadUsingDefaults(showDates: Bool) {                                        //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    
    lastLoginDateStrings = defaults.stringArray(forKey: "savedLastLoginDateString") ?? ["-"]
    
    if showDates {
        print("last login: \(lastLoginDateStrings)")
    }
}


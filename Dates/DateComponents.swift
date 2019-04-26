//  DateComponents.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit


func hourOf(_ date: Date) -> Int {
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "HH" // HH is 24-hr; hh is 12-hr; ha is 12-hr showing am/pm
    let hour = Int(dateFormatter.string(from: date))
    return hour! //!  MAY CRASH HERE DEPENDING ON 24HR TIME SETTING & LOCATION (IE IF NOT ON 24HR & LOCATION SET TO UK) !!! (is this still true?)
}


func dayIntOf(_ date: Date) -> Int {
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "d"
    let day = Int(dateFormatter.string(from: date))
    return day!
}


func monthNameOf(_ date: Date) -> String {                           // below methods basically return same as above one, but selectively
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "MMMM"
    let nameOfMonth = dateFormatter.string(from: date)
    return nameOfMonth
}


func yearOf(_ date: Date) -> Int {
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "YYYY"
    let year = Int(dateFormatter.string(from: date))
    return year!
}

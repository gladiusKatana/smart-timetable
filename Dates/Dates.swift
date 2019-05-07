//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func processCurrentDate() { 
    (year, month, day, weekday, hour, minute) = displayDate(Date())     //; print(formalDateString(Date(), comment: "process dates @ "))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + 1
    nowColumn = weekdaysAbbreviated.firstIndex(of: weekday)! + 1
    //print("-----------------------now cell at \([nowRow, nowColumn])")
}

func displayDate(_ inputDate: Date)
    -> (year: Int, monthStr: String, day: Int, weekday: String, hour: Int, minute: Int) {
        
        let year = Calendar.current.component(.year, from: inputDate)
        let month = months[Calendar.current.component(.month, from: inputDate) - 1]
        let day = Calendar.current.component(.day, from: inputDate)
        let weekday = wkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
        let hour = Calendar.current.component(.hour, from: inputDate)
        let minute = Calendar.current.component(.minute, from: inputDate)
        //let secInt = Calendar.current.component(.second, from: inputDate)
        return (year, month, day, weekday, hour, minute)
}


func formattedDateString(_ date: Date, comment: String) -> String {
    let (yr, mnthString, dayI, wkday, hr, min) = displayDate(date)
    let minTwoDigits = minuteStringShowingTwoDigits(min)
    return "\(comment) \(wkday), \(mnthString) \(dayI), \(yr), \(hr):\(minTwoDigits)"
}


func minuteStringShowingTwoDigits(_ minute: Int) -> String {
    var minTwoDigits = "\(minute)"
    if minute < 10 {minTwoDigits = "0\(minute)"}
    return minTwoDigits
}



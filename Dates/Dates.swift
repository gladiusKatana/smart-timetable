//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func processCurrentDate() { 
    (year, monthString, dayInt, weekday, hour, minute) = displayDate(Date()) //; print(formalDateString(Date(), comment: "process dates @ "))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + 1
    nowColumn = weekdaysAbbrev.firstIndex(of: weekday)! // why no + 1 needed here? because the method Calendar.current.component(:) uses...
    print("-----------------------now cell at \([nowRow, nowColumn])")//           ... weekday-indices that start on Sunday
}

func createDate(_ year: Int, monthInt: Int, dayInt: Int, hour: Int, minute: Int) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(year)/\(monthInt)/\(dayInt) \(hour):\(minute)") else {
        print("could not create date with this input, returning current date instead")
        return Date()
    }
    return date
}


func formalDateString(_ date: Date, comment: String) -> String {
    let (yr, monString, dayI, wkday, hr, min) = displayDate(date)
    return "\(comment) \(wkday), \(monString) \(dayI), \(yr), \(hr):\(min)"
}


func displayDate(_ inputDate: Date)
    -> (year: Int, monthStr: String, dayInt: Int, weekday: String, hour: Int, minute: Int) {
        
    let yrInt = Calendar.current.component(.year, from: inputDate)
    let moStr = months[Calendar.current.component(.month, from: inputDate) - 1]
    let dyInt = Calendar.current.component(.day, from: inputDate)
    let wdyStr = weekdaysAbbrev[Calendar.current.component(.weekday, from: inputDate) - 1]
//    let wdyStr = wkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
    let hrInt = Calendar.current.component(.hour, from: inputDate)
    let minInt = Calendar.current.component(.minute, from: inputDate)
    //let secInt = Calendar.current.component(.second, from: inputDate)

//    print("***[\(era)] \(wdyInt), \(moInt) \(dyInt), \(yrInt), \(hrInt):\(minInt):\(secInt)")
    return (yrInt, moStr, dyInt, wdyStr, hrInt, minInt)
}

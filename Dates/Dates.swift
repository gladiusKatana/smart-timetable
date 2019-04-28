//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit


func processCurrentDate() { 
    (year, monthString, dayInt, weekday, hour, minute) = displayDate(Date()) //; print(formalDateString(Date(), comment: "process dates @ "))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + 1
    nowColumn = weekdaysAbbreviated.firstIndex(of: weekday)! + 1
    print("-----------------------now cell at \([nowRow, nowColumn])")
}


//func createDate(_ year: Int, monthInt: Int, dayInt: Int, hour: Int, minute: Int) -> Date {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy/MM/dd HH:mm"
//    guard let date = formatter.date(from: "\(year)/\(monthInt)/\(dayInt) \(hour):\(minute)") else {
//        print("could not create date with this input, returning current date instead")
//        return Date()
//    }
//    return date
//}


func displayDate(_ inputDate: Date)
    -> (year: Int, monthStr: String, dayInt: Int, weekday: String, hour: Int, minute: Int) {
        
        let year = Calendar.current.component(.year, from: inputDate)
        let month = months[Calendar.current.component(.month, from: inputDate) - 1]
        let dayInt = Calendar.current.component(.day, from: inputDate)
        let weekday = wkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
        let hour = Calendar.current.component(.hour, from: inputDate)
        let minute = Calendar.current.component(.minute, from: inputDate)
        //let secInt = Calendar.current.component(.second, from: inputDate)

        return (year, month, dayInt, weekday, hour, minute)
}


func formalDateString(_ date: Date, comment: String) -> String {
    let (yr, monString, dayI, wkday, hr, min) = displayDate(date)
    return "\(comment) \(wkday), \(monString) \(dayI), \(yr), \(hr):\(min)"
}

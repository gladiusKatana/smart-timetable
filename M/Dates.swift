//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func processCurrentDate() { 
    (year, monthString, dayInt, weekday, hour, minute) = displayDate(Date()) //; print(formalDateString(Date(), comment: "process dates @ "))
    
    nowRow = hourOf(Date()) + 1
    nowColumn = daysOfTheWeek.firstIndex(of: weekday)! + 1                   //; print("-----------------------now cell at \([nowRow, nowColumn])")
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
    -> (year: Int, monthStr: String, dayInt: Int, weekday: String, hour: Int, minute: Int)
{
    let yearFormatter = DateFormatter();        yearFormatter.dateFormat = "YYYY"
    let monthStrFormatter = DateFormatter();    monthStrFormatter.dateFormat = "MMMM"
    let dayIntFormatter = DateFormatter();      dayIntFormatter.dateFormat = "d"
    let weekdayFormatter = DateFormatter();     weekdayFormatter.dateFormat = "EEEE"
    let hourFormatter = DateFormatter();        hourFormatter.dateFormat = "HH"
    //let minuteFormatter = DateFormatter();      minuteFormatter.dateFormat = "mm"
    
    let year = Int(yearFormatter.string(from: inputDate as Date))
    let monthStr = monthStrFormatter.string(from: inputDate as Date)
    let dayInt = Int(dayIntFormatter.string(from: inputDate as Date))
    let weekday = weekdayFormatter.string(from: inputDate as Date)//.capitalized
    let hourInt = Int(hourFormatter.string(from: inputDate as Date))
    //let minuteInt = Double(minuteFormatter.string(from: inputDate as Date))
    let minuteInt = Calendar.current.component(.minute, from: inputDate)
    
    return (year!, monthStr, dayInt!, weekday, hourInt!, minuteInt)
}

//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func processCurrentDate() { 
    (year, monthString, dayInt, weekday, hour, minute) = displayDate(currentDate)
    
    nowRow = hourOf(currentDate)  
    nowColumn = daysOfTheWeek.firstIndex(of: weekday)!
}


func createDate(_ year: Int, monthInt: Int, dayInt: Int, hour: Int) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(year)/\(monthInt)/\(dayInt) \(hour):00") else {
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
    let minuteFormatter = DateFormatter();      minuteFormatter.dateFormat = "HH"
    
    let year = Int(yearFormatter.string(from: inputDate as Date))
    let monthStr = monthStrFormatter.string(from: inputDate as Date)
    let dayInt = Int(dayIntFormatter.string(from: inputDate as Date))
    let weekday = weekdayFormatter.string(from: inputDate as Date)//.capitalized
    let hourInt = Int(hourFormatter.string(from: inputDate as Date))
    let minuteInt = Int(minuteFormatter.string(from: inputDate as Date))
    
    return (year!, monthStr, dayInt!, weekday, hourInt!, minuteInt!)
}

//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func processCurrentDate() { 
    (weekday, monthString, dayInt, year) = displayDate(currentDate)
    
    nowRow = hourOf(currentDate)
    nowColumn = daysOfTheWeek.firstIndex(of: weekday)!
}


func createDate(_ year: Int, monthInt: Int, dayInt: Int) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(year)/\(monthInt)/\(dayInt) 00:00") else {
        print("could not create date with this input, returning current date instead")
        return Date()
    }
    return date
}


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


func formalDateString(_ date: Date, comment: String) -> String {
    let (wkday, monString, dayI, yr) = displayDate(date)
    return "\(comment) \(wkday), \(monString) \(dayI), \(yr)"
}

func displayDate(_ inputDate: Date)
    -> (weekday: String, monthStr: String, dayInt: Int, year: Int)
{
    let weekdayFormatter = DateFormatter();     weekdayFormatter.dateFormat = "EEEE"
    let monthStrFormatter = DateFormatter();    monthStrFormatter.dateFormat = "MMMM"
    let dayIntFormatter = DateFormatter();      dayIntFormatter.dateFormat = "d"
    let yearFormatter = DateFormatter();        yearFormatter.dateFormat = "YYYY"
    
    let weekday = weekdayFormatter.string(from: inputDate as Date)//.capitalized
    let monthStr = monthStrFormatter.string(from: inputDate as Date)
    let dayInt = Int(dayIntFormatter.string(from: inputDate as Date))
    let year = Int(yearFormatter.string(from: inputDate as Date))
    
    return (weekday, monthStr, dayInt!, year!)
}

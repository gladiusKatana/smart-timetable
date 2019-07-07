//  Dates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

func processCurrentDate() { 
    (year, month, day, weekday, weekdayLong, hour, minute) = displayDate(Date(), roundedDown: true) //; print(formattedDateString(Date(), comment: "process dates @ ", short: false))
    
    nowRow = Calendar.current.component(.hour, from: Date()) + 1
    nowColumn = weekdaysAbbreviated.firstIndex(of: weekday)! + 1
    
    if selectedTimeBlockPath == [0, 0] {selectedTimeBlockPath = [nowColumn, nowRow]}
    if timeBlock == TimeBlock(values:(0, 0)) {timeBlock = TimeBlock(values:(nowColumn, nowRow))}
    
    if previousSelectedTimeBlockPath == [0, 0] {previousSelectedTimeBlockPath = [nowColumn, nowRow]}
    if previousTimeBlock == TimeBlock(values:(0, 0)) {previousTimeBlock = TimeBlock(values:(nowColumn, nowRow))}
}

func displayDate(_ inputDate: Date, roundedDown: Bool)
    -> (year: Int, monthStr: String, day: Int, weekday: String, weekdayLong: String, hour: Int, minute: Int) {
        
    let yr = Calendar.current.component(.year, from: inputDate)
    let mnth = months[Calendar.current.component(.month, from: inputDate) - 1]
    let dy = Calendar.current.component(.day, from: inputDate)
        let wkdyLong = fullWeekdaysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
    let wkdy = wkdysDefaultOrder[Calendar.current.component(.weekday, from: inputDate) - 1]
    let hr = Calendar.current.component(.hour, from: inputDate)
    var mn : Int
    if roundedDown {mn = 0}
    else {mn = Calendar.current.component(.minute, from: inputDate)}   //; let secInt = Calendar.current.component(.second, from: inputDate)
    
    return (yr, mnth, dy, wkdy, wkdyLong, hr, mn) //MAY CRASH IF YOUR DEVICE IS   NOT  ON 24HR TIME (or is? ...bug seems to be gone but will double check.)
}

func formattedDateString(_ date: Date, roundedDown: Bool, prefix: String, suffix: String, short: Bool) -> String {
    let (yr, mnthString, dayI, wkday, wkdayLong, hr, min) = displayDate(date, roundedDown: roundedDown)
    let minTwoDigits = minuteStringShowingTwoDigits(min)
    var ampm = ""; if hr < 13 {ampm = "am"} else {ampm = "pm"}
    if short {
        return "\(prefix) \(wkdayLong) \((hr < 13) ? hr : hr - 12)\(ampm)" //"\(prefix) \(wkday) \(hr):\(minTwoDigits)"
    }
    else {
        if mnthString == "January" || mnthString == "December" {
            return "\(prefix) \(wkday). \(mnthString.prefix(3)) \(dayI), \(yr) @ \(hr):\(minTwoDigits)\(suffix)"
        }
        else {
            return "\(prefix) \(wkday). \(mnthString.prefix(3)) \(dayI) @ \(hr):\(minTwoDigits)\(suffix)"
        }
    }
}

func minuteStringShowingTwoDigits(_ minute: Int) -> String {
    var minTwoDigits = "\(minute)"
    if minute < 10 {minTwoDigits = "0\(minute)"}
    return minTwoDigits
}


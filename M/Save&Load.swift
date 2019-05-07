//  SaveUsingDefaults.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

func saveUsingDefaults(showDate: Bool) {
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    let defaults = UserDefaults.standard
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    
    if showDate {print("saving via defaults, date logged:\n\(lastLoginDateComponents)")}
}

func loadUsingDefaults(showDate: Bool) {                                        //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    
    lastLoginDateComponents = defaults.array(forKey: "savedLastLoginDate") ?? ["-"] /// *** remember, it's a  [0, "", 0, "", 0, 0] as [Any]
    
    let yearLoaded = lastLoginDateComponents[0] as! Int                         //; print("year loaded: \(yearLoaded)")
    let monthLoaded = lastLoginDateComponents[1] as! String                     //; print("month loaded: \(monthLoaded)")
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1                //; print("int: \(monthLoadedInt)")
    let dayLoaded = lastLoginDateComponents[2] as! Int                          //; print("day loaded: \(dayLoaded)")
    //let weekdayLoaded = lastLoginDateComponents[3] as! String                 //; print("weekday loaded: \(weekdayLoaded)")
    
    let hourLoaded = lastLoginDateComponents[4] as! Int                         //; print("hour loaded: \(hourLoaded)")
    let minuteLoaded = lastLoginDateComponents[5] as! Int                       //; print("minute loaded: \(minuteLoaded)")
    
    lastLoggedInDate = createDateFromSavedComponents(year: yearLoaded, month: monthLoadedInt, day: dayLoaded, hour: hourLoaded, minute: minuteLoaded)
    
    if showDate {
        print("last login    (unformatted gmt)  \(lastLoggedInDate)")
        print("                 (formatted)    \(formattedDateString(lastLoggedInDate, comment: ""))")
    }
}

func createDateFromSavedComponents(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {// uses all cmpnts. except weekday (unnecessary)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(minute)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
}

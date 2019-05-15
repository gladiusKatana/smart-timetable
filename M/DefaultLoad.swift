//  DefaultLoad.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultLoad(showDate: Bool) {                                                  //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components
        let yearLoaded = lastLoginDateComponents[0] as! Int                         //; print("year loaded: \(yearLoaded)")
        let monthLoaded = lastLoginDateComponents[1] as! String                     //; print("month loaded: \(monthLoaded)")
        let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1                //; print("int: \(monthLoadedInt)")
        let dayLoaded = lastLoginDateComponents[2] as! Int                          //; print("day loaded: \(dayLoaded)")
        //let weekdayLoaded = lastLoginDateComponents[3] as! String                   //; print("weekday loaded: \(weekdayLoaded)")
        let hourLoaded = lastLoginDateComponents[4] as! Int                         //; print("hour loaded: \(hourLoaded)")
        let minuteLoaded = lastLoginDateComponents[5] as! Int                       //; print("minute loaded: \(minuteLoaded)")
        
        lastLoggedInDate = dateFromLoadedComponents(year: yearLoaded, month: monthLoadedInt, day: dayLoaded, hour: hourLoaded, minute: minuteLoaded)
        if showDate {
            print(formattedDateString(lastLoggedInDate, comment: "last login       (formatted)      ", short: false))
            print("              (unformatted gmt)    \(lastLoggedInDate)")
        }
    } else {
        let (yr, mo, dy, wkd, hr, mn) = displayDate(Date())
        lastLoginDateComponents = [yr, mo, dy, wkd, hr, mn] as [Any]
        print("\nfirst login; default previous login date components: \n\(lastLoginDateComponents)")
    }
    
    eventPathArrays = defaults.array(forKey: "savedNonDefaultTimeBlockPaths") as? [[Int]] ?? []
    eventDescriptionArrays = defaults.array(forKey: "savedNonDefaultTodoListItems") as? [[String]] ?? []
    
//    eventDateArrays = defaults.array(forKey: "savedNonDefaultTodoListDates") as? [[[Int(), String(), Int(), String(), Int(), Int()] as [Any] ]] ?? [[]]
//    eventDateArrays = defaults.array(forKey: "savedNonDefaultTodoListDates") as? [[Int(), String(), Int(), String(), Int(), Int()]] ?? []
    eventDateArrays = defaults.array(forKey: "savedNonDefaultTodoListDates") as? [[[Any]]] ?? [[[]]]
    
    populateDictionaryFromDefaults()
    
    print("\nnon default time block paths (\(eventPathArrays.count)): \n\(eventPathArrays)")
    print("\nnon default event descriptions (\(eventDescriptionArrays.count)): \n\(eventDescriptionArrays)")
    print("\nnon default event dates (\(eventDateArrays.count)): \n\(eventDateArrays)")
}

func dateFromLoadedComponents(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(year)/\(month)/\(day) \(hour):\(minute)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
}

func populateDictionaryFromDefaults() {
    var i = 0
    for path in eventPathArrays {
        let todoListItemDescriptions = eventDescriptionArrays[i]
        var events = [SimpleEvent]()
        
        for description in todoListItemDescriptions {
            let event = SimpleEvent(eventDescription: description, eventDate: Date())
            events.append(event)
        }
        let timeBlock = TimeBlock(values: (path[0], path[1]))
        eventsAtIndexPath[timeBlock] = events
        i += 1
    }
}


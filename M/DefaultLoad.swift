//  DefaultLoad.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

func defaultLoadData(showDate: Bool) {                                                      //print("(load using defaults)\n")
    let defaults = UserDefaults.standard
    if let components = defaults.array(forKey: "savedLastLoginDate") {
        lastLoginDateComponents = components  
        lastLoggedInDate = dateFromComponents(lastLoginDateComponents)
        if showDate {pryntLastLoginDate(); pryntCurrentDate()}
    } else {
        let (yr, mo, dy, wkd, _, hr, mn) = displayDate(Date(), roundedDown: true)
        lastLoginDateComponents = [yr, mo, dy, wkd, hr, mn]
        print("\nfirst login")
    }
    eventPathArrays = defaults.array(forKey: "savedTimeBlockPaths") as? [[Int]] ?? []
    eventDescriptionArrays = defaults.array(forKey: "savedTodoListItems") as? [[String]] ?? []
    eventStatusArrays = defaults.array(forKey: "savedTodoListStatuses") as? [[Int]] ?? []
    eventDateArrays = defaults.array(forKey: "savedTodoListDates") as? [[[Any]]] ?? [[[]]]
    populateDictionaryFromDefaults()    //; printSavedArrays()
}

func populateDictionaryFromDefaults() {
    var i = 0
    for path in eventPathArrays {
        let todoListItemDescriptions = eventDescriptionArrays[i] //!*
        var events = [SimpleEvent]()
        var j = 0
        for description in todoListItemDescriptions {
            let todoListItemStatus = eventStatusArrays[i][j]
            let dateComponents = eventDateArrays[i][j]                                      //; print("event date components: \(dateComponents)")
            let date = dateFromComponents(dateComponents)                             //; print("date: \(date)")
            let event = SimpleEvent(eventDescription: description, eventDate: date, eventStatus: EventStatus(rawValue: todoListItemStatus)!)
            //print("loaded event: '\(event.eventDescription)' [\(event.eventStatus)] with deadline:\(formattedDateString(date, roundedDown: true, prefix: "", suffix: "", short: false))")
            events.append(event)
            j += 1
        }
        let timeBlock = TimeBlock(values: (path[0], path[1]))
        eventsAtIndexPath[timeBlock] = events
        i += 1
    }
}

func dateFromComponents(_ array: [Any]) -> Date {
    let yearLoaded = array[0] as! Int                               //; print("year loaded: \(yearLoaded)")     // will probably replace with...
    let monthLoaded = array[1] as! String                           //; print("month loaded: \(monthLoaded)")   //... conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1    //; print("int: \(monthLoadedInt)")         //...rather than forced downcasts,
    let dayLoaded = array[2] as! Int                                //; print("day loaded: \(dayLoaded)")       //...for all bindings here
    //let weekdayLoaded = array[3] as! String                       //; print("weekday loaded: \(weekdayLoaded)")
    let hourLoaded = array[4] as! Int                               //; print("hour loaded: \(hourLoaded)")
    let minuteLoaded = array[5] as! Int                             //; print("minute loaded: \(minuteLoaded)")
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    guard let date = formatter.date(from: "\(yearLoaded)/\(monthLoadedInt)/\(dayLoaded) \(hourLoaded):\(minuteLoaded)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
}

func pryntLastLoginDate() {// spelling 'prynt' with a y so this function's existence does not cause override of autocomplete for print statements
    print(formattedDateString(lastLoggedInDate, roundedDown: false, prefix: "last login              ", suffix: "", short: false))
    //print("              (unformatted gmt)    \(lastLoggedInDate)\n")
}

func pryntCurrentDate() {
    print(formattedDateString(Date(), roundedDown: false, prefix: "date right now          ", suffix: "", short: false)); print("")
    //print("              (unformatted gmt)    \(Date())\n")
}


//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

func defaultSaveData(showDate: Bool) {                      
    if showDate{print(formattedDateString(Date(), prefix: "✔︎saved to your device on", suffix: "", short: false))}
    let defaults = UserDefaults.standard
    eventPathArrays.removeAll();   eventDescriptionArrays.removeAll(); eventStatusArrays.removeAll(); eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                         //; print("key: [\(key)  values \((a, b))")
        
        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptyEventDescription {                                                       //; print(\((a, b)): \(todo))
            eventPathArrays.append([a, b])
        }
    }
    
    for vals in eventsAtIndexPath.values {
        if vals.count > 1 || vals.count == 1 && vals[0].eventDescription != defaultEmptyEventDescription {
            var eventDescriptions = [String]()
            var eventStatuses = [Int]()
            
            var eventDateComponents = [[Int(), String(), Int(), String(), Int(), Int()]] as [[Any]]     // [[0, "", 0, "", 0, 0] as [Any]]
            eventDateComponents.removeAll()   // *
            
            for event in vals {
                eventDescriptions.append(event.eventDescription)
                eventStatuses.append(event.eventStatus.rawValue)
                
                let (yr, mnth, dy, wkdy, hr, mn) = displayDate(event.eventDate)
                eventDateComponents.append([yr, mnth, dy, wkdy, hr, mn])
            }
            eventDescriptionArrays.append(eventDescriptions)
            eventStatusArrays.append(eventStatuses)
            eventDateArrays.append(eventDateComponents)
        }//else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    }
    printSavedArrays()
    lastLoginDateComponents = [year, month, day, weekday, hour, minute] // setting the latest login date (for saving) as the date this minute
    
    defaults.set(eventPathArrays, forKey: "savedTimeBlockPaths")
    defaults.set(eventDescriptionArrays, forKey: "savedTodoListItems")
    defaults.set(eventStatusArrays, forKey: "savedTodoListStatuses")
    defaults.set(eventDateArrays, forKey: "savedTodoListDates")
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}

func printSavedArrays() { let consoleAlignmentSpace = "                     "
    //print("\n\(consoleAlignmentSpace)\(eventPathArrays.count) time blocks: \n\(consoleAlignmentSpace)\(eventPathArrays)")
    print("\n\(consoleAlignmentSpace)\(eventDescriptionArrays.count) events: \n\(consoleAlignmentSpace)\(eventDescriptionArrays)")
    print("\n\(consoleAlignmentSpace)\(eventStatusArrays.count) event-status raw values: \n\(consoleAlignmentSpace)\(eventStatusArrays)")
    let elementsNewlined = eventDateArrays.map {"\($0)"}.joined(separator: "\n\(consoleAlignmentSpace)")
    let dateColonOrNot = (eventDateArrays.isEmpty) ? "." : ":"
    print("\n\(consoleAlignmentSpace)\(eventDateArrays.count) event dates\(dateColonOrNot) \n\(consoleAlignmentSpace)\(elementsNewlined)")
}


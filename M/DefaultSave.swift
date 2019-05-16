//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultSave(showDate: Bool) { if showDate {print(formattedDateString(Date(), comment: "saving via defaults, date logged: ", short: false))}
    let defaults = UserDefaults.standard
    
    eventPathArrays.removeAll();   eventDescriptionArrays.removeAll()
    eventDateArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                         //; print("key: [\(key)  values \((a, b))")
        
        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}/*alternate to guard/guard/if: below*/
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptEventDescription {                                                        //; print(\((a, b)): \(todo))
            eventPathArrays.append([a, b])
        }
    }
    
    for vals in eventsAtIndexPath.values {
        if vals.count > 1 || vals.count == 1 && vals[0].eventDescription != defaultEmptEventDescription {
            var eventDescriptions = [String]()
            
            var eventDateComponents = [[Int(), String(), Int(), String(), Int(), Int()] as [Any]] // [[0, "", 0, "", 0, 0] as [Any]]
            eventDateComponents.removeAll()
            
            for event in vals {
                let str = event.eventDescription
                eventDescriptions.append(str)
                
                let (yr, mnth, dy, wkdy, hr, mn) = displayDate(event.eventDate)
                eventDateComponents.append([yr, mnth, dy, wkdy, hr, mn])
            }
            eventDescriptionArrays.append(eventDescriptions)
            eventDateArrays.append(eventDateComponents)
        }
        //else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    }
    printSavedArrays()
    lastLoginDateComponents = [year, month, day, weekday, hour, minute] // setting the latest login date (for saving) as the date this minute
    
    defaults.set(eventPathArrays, forKey: "savedTimeBlockPaths")
    defaults.set(eventDescriptionArrays, forKey: "savedTodoListItems")
    defaults.set(eventDateArrays, forKey: "savedTodoListDates")
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}

func printSavedArrays() {
    print("time block paths (\(eventPathArrays.count)): \n\(eventPathArrays)")
    print("event descriptions (\(eventDescriptionArrays.count)): \n\(eventDescriptionArrays)")
    print("event dates (\(eventDateArrays.count)): \n\(eventDateArrays)")
}

/*if let val = eventsAtIndexPath[key] {
 if let todo = val.last?.eventDescription, todo != defaultEmptEventDescription {
 print(todo)
 }
 }*/

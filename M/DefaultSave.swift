//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

var nonDefaultPaths = [[Int]]()

func defaultSave(showDate: Bool) {
    
    if showDate {print(formattedDateString(Date(), comment: "saving via defaults, date logged: ", short: false))}
    
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); itemDescriptionArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])

//        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}/*alternate to guard/guard/if: below*/
//        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
//        if todo != defaultEmptEventDescription {
//            let pathString = "\((a, b)): \(todo)"
//            nonDefaultPaths.append([a, b])
//            print(pathString)
//        }
        
    }
    print("\ntime block paths (\(timeBlockPaths.count)): \(timeBlockPaths)")
    
    
    for vals in eventsAtIndexPath.values {
        var eventDescriptions = [String]()
        for event in vals {
            var str = event.eventDescription
            
            if str == defaultEmptEventDescription {str = ":)"}
            if str == ":)" {str = defaultEmptEventDescription}
            
            eventDescriptions.append(str)
        }
        itemDescriptionArrays.append(eventDescriptions)
    }
    print("\ntodo list item descriptions (\(itemDescriptionArrays.count)): \(itemDescriptionArrays)")
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(itemDescriptionArrays, forKey: "savedTodoListItems")
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}

/*if let val = eventsAtIndexPath[key] {                                                     // alternative to below section
    if let todo = val.last?.eventDescription, todo != defaultEmptEventDescription {
        print(todo)
    }
}*/

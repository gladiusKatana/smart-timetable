//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultSave(showDate: Bool) {
    
    if showDate {print(formattedDateString(Date(), comment: "saving via defaults, date logged: ", short: false))}
        
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); itemDescriptionArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                             //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])
        
        
    }
//    print("\ntime block paths (\(timeBlockPaths.count)): \(timeBlockPaths)")
    
    
    for vals in eventsAtIndexPath.values {
        var eventDescriptions = [String]()
        for str in vals {
            eventDescriptions.append(str.eventDescription)
        }
        itemDescriptionArrays.append(eventDescriptions)
    }
//    print("\ntodo list item descriptions (\(itemDescriptionArrays.count)): \(itemDescriptionArrays)")
    
    
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(itemDescriptionArrays, forKey: "savedTodoListItems")
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}


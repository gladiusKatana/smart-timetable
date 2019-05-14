//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultSave(showDate: Bool) {
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); itemDescriptionArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                 //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])
    }
    
    //print("todo list item descriptions (\(itemDescriptionArrays.count)): \(itemDescriptionArrays)")
    //print("time block paths (\(timeBlockPaths.count)): \(timeBlockPaths)")
    
    for vals in eventsAtIndexPath.values {                                       //print("value: \(val)")
        var eventDescriptions = [String]()
        for str in vals {
            eventDescriptions.append(str.eventDescription)
        }
        itemDescriptionArrays.append(eventDescriptions)
    }
    
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(itemDescriptionArrays, forKey: "savedTodoListItems")
    
    if showDate {print("saving via defaults, date logged:\n\(lastLoginDateComponents)")}
}


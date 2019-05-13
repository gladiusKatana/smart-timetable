//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultSave(showDate: Bool) {
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); todoListItems.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                 //; print("key: [\(key)  values \((a, b))")
        timeBlockPaths.append([a, b])
    }
    
    for val in eventsAtIndexPath.values {                                       //print("value: \(val)")
        todoListItems.append(val)
    }
    
    //print("todo list items (\(todoListItems.count)): \(todoListItems)")
    //print("time block paths (\(timeBlockPaths.count)): \(timeBlockPaths)")
    
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
    defaults.set(timeBlockPaths, forKey: "savedTimeBlockPaths")
    defaults.set(todoListItems, forKey: "savedTodoListItems")
    
    if showDate {print("saving via defaults, date logged:\n\(lastLoginDateComponents)")}
}


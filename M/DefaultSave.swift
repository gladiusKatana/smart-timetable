//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

var nonDefaultTimeBlockPaths = [[Int]]()
var nonDefaultItemDescriptionArrays = [[String]]()//above arrays' non-'nonDefault' counterparts are catch-all arrays (literally: to 'catch 'em all')

func defaultSave(showDate: Bool) {
    
    if showDate {print(formattedDateString(Date(), comment: "saving via defaults, date logged: ", short: false))}
    
    let defaults = UserDefaults.standard
    
    timeBlockPaths.removeAll(); itemDescriptionArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")

        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}/*alternate to guard/guard/if: below*/
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptEventDescription {
            //let pathString = "\((a, b)): \(todo)"                                                 //; print(pathString)
            nonDefaultTimeBlockPaths.append([a, b])
        }
        
        timeBlockPaths.append([a, b])                                       //probably temporary, catch-all array (literally: to 'catch 'em all'!)
    }
//    print("\ntime block paths (\(timeBlockPaths.count)): \(timeBlockPaths)")
    print("\nnon default time block paths (\(nonDefaultTimeBlockPaths.count)): \(nonDefaultTimeBlockPaths)")
    
    for vals in eventsAtIndexPath.values {
        var eventDescriptions = [String]()
        
        if vals.count > 1 || vals.count == 1 && vals[0].eventDescription != defaultEmptEventDescription {
            var nonDefaultEventDescriptions = [String]()
            for event in vals {
                let str = event.eventDescription
                nonDefaultEventDescriptions.append(str)
            }

            nonDefaultItemDescriptionArrays.append(nonDefaultEventDescriptions)
        } //else {print("\n!descriptions array at this time block contains only default (\(defaultEmptEventDescription)), and it's: \(vals[0].eventDescription)")}
    
        for event in vals {
            let str = event.eventDescription
            eventDescriptions.append(str)
        }
        
        itemDescriptionArrays.append(eventDescriptions)                     //probably temporary, catch-all array (literally: to 'catch 'em all'!)
    }
//    print("\ntodo list item descriptions (\(itemDescriptionArrays.count)): \(itemDescriptionArrays)")
    print("\nnon default descriptions (\(nonDefaultItemDescriptionArrays.count)): \(nonDefaultItemDescriptionArrays)")
    
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

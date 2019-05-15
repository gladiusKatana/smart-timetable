//  DefaultSave.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

func defaultSave(showDate: Bool) {
    
    if showDate {print(formattedDateString(Date(), comment: "saving via defaults, date logged: ", short: false))}
    
    let defaults = UserDefaults.standard
    
    nonDefaultTimeBlockPaths.removeAll();   nonDefaultItemDescriptionArrays.removeAll()
    
    for key in eventsAtIndexPath.keys {
        let (a, b) = key.values                                                                     //; print("key: [\(key)  values \((a, b))")

        guard let val = eventsAtIndexPath[key] else {print("could not create event at index path key"); return}/*alternate to guard/guard/if: below*/
        guard let todo = val.last?.eventDescription else {print("no description at event value"); return}
        if todo != defaultEmptEventDescription {
            //let pathString = "\((a, b)): \(todo)"                                                 //; print(pathString)
            nonDefaultTimeBlockPaths.append([a, b])
        }
    }
    print("\nnon default time block paths (\(nonDefaultTimeBlockPaths.count)): \n\(nonDefaultTimeBlockPaths)")
    
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
    }
    print("\nnon default descriptions (\(nonDefaultItemDescriptionArrays.count)): \n\(nonDefaultItemDescriptionArrays)")
    
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    defaults.set(nonDefaultTimeBlockPaths, forKey: "savedNonDefaultTimeBlockPaths")
    defaults.set(nonDefaultItemDescriptionArrays, forKey: "savedNonDefaultTodoListItems")
    defaults.set(lastLoginDateComponents, forKey: "savedLastLoginDate")
}

/*if let val = eventsAtIndexPath[key] {
    if let todo = val.last?.eventDescription, todo != defaultEmptEventDescription {
        print(todo)
    }
}*/

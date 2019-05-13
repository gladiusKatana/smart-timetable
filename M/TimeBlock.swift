//  TimeBlock.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

struct TimeBlock<T: Hashable, U: Hashable>: Hashable {
    let values : (T, U)
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
}


func ==<T:Hashable,U:Hashable>(lhs: TimeBlock<T,U>, rhs: TimeBlock<T,U>) -> Bool { // comparison function
    return lhs.values == rhs.values                                      // for conforming to Equatable protocol
}


extension CollectionVC {
    
    func addToTimeBlocks(column: Int, row: Int, textEntered: String) {

        let timeBlock = TimeBlock(values:(column, row))
        let simpleEvent = SimpleEvent(eventDescription: textEntered, eventDate: selectedCellDate)
        
        if eventsAtIndexPath[timeBlock] == nil {
            eventsAtIndexPath[timeBlock] = [simpleEvent]
        }
        else {
            eventsAtIndexPath[timeBlock]!.append(simpleEvent)
        }
        
        print("adding to time block @ \((column, row)); \ntodos: \(eventsAtIndexPath[timeBlock]!)\n") //\(timeBlock)
    }
}


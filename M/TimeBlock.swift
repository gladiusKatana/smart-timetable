//  TimeBlock.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

struct TimeBlock<T: Hashable, U: Hashable>: Hashable {
    let values : (T, U)
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
}


func ==<T:Hashable,U:Hashable>(lhs: TimeBlock<T,U>, rhs: TimeBlock<T,U>) -> Bool {  // comparison function
    return lhs.values == rhs.values                                                 // for conforming to Equatable protocol
}


extension CollectionVC {
    
    func addToTimeBlocks(column: Int, row: Int, textEntered: String) {
        
        let timeBlock = TimeBlock(values:(column, row))
        let simpleEvent = SimpleEvent(eventDescription: textEntered, eventDate: selectedCellDate, eventStatus: .upcoming)
        
        if eventsAtIndexPath[timeBlock] != nil {
            if eventsAtIndexPath[timeBlock]?.last!.eventDescription == defaultEmptyEventDescription {
                eventsAtIndexPath[timeBlock] = [simpleEvent]
            }
            else {
                eventsAtIndexPath[timeBlock]!.append(simpleEvent)
            }
        }
        else {eventsAtIndexPath[timeBlock] = [simpleEvent]}
    }
}


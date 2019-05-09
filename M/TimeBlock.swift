//  IndexPathDictionary.swift
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
    
    func addToTimeBlocks(column: Int, row: Int, text: String) {

        let timeBlock = TimeBlock(values:(column, row))
        
        if eventsAtIndexPath[timeBlock] == nil {
            eventsAtIndexPath[timeBlock] = [text]
        }
        else {
            eventsAtIndexPath[timeBlock]!.append(text)
        }
        
        print("adding to time block @ \((column, row)); \ntodos: \(eventsAtIndexPath[timeBlock]!)\n") //\(timeBlock)
//        print("adding to time block @ \((column, row)); \ntodos: \(eventsAtIndexPath)\n")
    }
}

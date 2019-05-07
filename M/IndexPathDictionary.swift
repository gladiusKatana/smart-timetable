//  IndexPathDictionary.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit


struct IndexPathDictionary<T: Hashable, U: Hashable>: Hashable {
    let values : (T, U)
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
}


func ==<T:Hashable,U:Hashable>(lhs: IndexPathDictionary<T,U>, rhs: IndexPathDictionary<T,U>) -> Bool { // comparison function
    return lhs.values == rhs.values                                      // for conforming to Equatable protocol
}


extension CollectionVC {
    
    func addToPairMap(column: Int, row: Int, text: String) {
        let path = IndexPathDictionary(values:(column, row))
        
        if eventsAtIndexPath[path] == nil {
            let events = [text]
            eventsAtIndexPath[path] = events                            //; print("pair-map: \(pairMap)")
        }
        else {
            eventsAtIndexPath[path]!.append(text)
        }
    }
}

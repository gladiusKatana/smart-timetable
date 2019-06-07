//  CollectionViewType.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

enum CollectionViewType: Int {
    case initial = 0
    case hours, todoList, days, months, years
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'currentTopVC'"
            
        case .hours:
            return "shows the hours of this week"
            
        case .todoList:
            return "shows the todo list items of this hour"
            
        case .days:
            return "shows the days of this month"
            
        case .months:
            return "shows the months of this year"
            
        case .years:
            return "shows the years of this century"
        }
    }
}


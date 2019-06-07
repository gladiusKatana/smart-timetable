//  SimpleEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import Foundation

class SimpleEvent: NSObject {
    
    var eventDescription = ""               // description of an event coming up (or todo-list item) on this day
    var eventDate = Date()                  // date the event/action occurs or must be done by
    var eventStatus = EventStatus.upcoming
    //var recurring = false
    
    init(eventDescription: String, eventDate: Date) {
        self.eventDescription = eventDescription
        self.eventDate = eventDate
    }
    
    func showEventProperties() {
        var descriptor = ""
        if eventStatus == .upcoming {
            descriptor = "will occur on"
        }
        else {
            descriptor = "occurred on"
        }
        print("\n Event: \(eventDescription)\n (\(eventStatus)); \(descriptor): \(eventDate)\n")
    }
}

enum EventStatus: Int {
    case upcoming = 0
    case occurred, done, delegated, obviated, deferred
    func simpleDescription() -> String {
        switch self {
        case .occurred:
            return "event occurred"
        case .done:
            return "task was done. Nice!"
        case .delegated:
            return "task was delegated to someone else"
        case .obviated:
            return "task was obviated; no need to do it anymore"
        case .deferred:
            return "task was deferred; it will show in the time-block chosen during deferral"
        default:
            return "(default event or task description)"
        }
    }
}


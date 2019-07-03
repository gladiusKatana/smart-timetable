//  DateCheck.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CollectionVC {
    
    func checkDatePeriodically(completion: () -> ()) {                                                  //print("\(Date())")
        
        if "\(Date())".contains(":00:") {                                                               //print("the hour ticked over")
            
            if nowRow == timetableLayout.rows - 1 && nowColumn == timetableLayout.cols - 1 {            //print("the week just rolled over")
                lastLoginDateComponents = [year, month, day, weekday, hour, minute]
                lastLoggedInDate = dateFromLoadedComponents(lastLoginDateComponents)
                pryntLastLoginDate()
                pryntCurrentDate()
            }
            
            if !reloadedFromHourTickingOver {
                
                DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                    self?.reloadCV()
                }
                
                reloadedFromHourTickingOver = true
            }
            else {
                reloadedFromHourTickingOver = false
            }
        }
        
        completion()
    }
    
    func kickoffTimer() {                                                                               //print(Date())//print("·")
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.checkDatePeriodically(){self!.kickoffTimer()}
        }
    }
}


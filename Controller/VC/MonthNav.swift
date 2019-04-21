//  MonthNav.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    @objc func incrementMonth() {                                                       //print("incrementing month")
        
        let currentMonthInt = months.firstIndex(of: monthString)! + 1
        var nextMonth = 0; var thisYearOrNext = year
        
        if currentMonthInt == 12 {
            nextMonth = 1; thisYearOrNext = year + 1
        }
        else {
            nextMonth = currentMonthInt + 1
        }
        
        let dayNextMonth = createDate(thisYearOrNext, monthInt: nextMonth, dayInt: 1)
        resetCurrentDateAndReload(dayNextMonth)
    }
    
    
    @objc func decrementMonth() {                                                       //print("decrementing month")
        
        let currentMonthInt = months.firstIndex(of: monthString)! + 1
        var lastMonth = 0; var thisYearOrLast = year
        
        if currentMonthInt == 1 {
            lastMonth = 12; thisYearOrLast = year - 1
        }
        else {
            lastMonth = currentMonthInt - 1
        }
        
        let dayLastMonth = createDate(thisYearOrLast, monthInt: lastMonth, dayInt: 1)
        resetCurrentDateAndReload(dayLastMonth)
    }
    
    
    func resetCurrentDateAndReload(_ newDate: Date) {
        
        if monthNameOf(newDate) == monthNameOf(Date()) && yearOf(newDate) == yearOf(Date()) {
            currentDate = Date()
        }
        else {currentDate = newDate}
        
        processCurrentDate()
        setupViewTitle("\(monthString) \(year)\n", numLines: 1, alignment: .left)
        reloadCV()
    }
}


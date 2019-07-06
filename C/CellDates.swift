//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        showNowCell(cell: cell, column: column, row: row)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead // dates never actually rounded: just displayed rounded sometimes
        processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
        
//        let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
//        let dy = Calendar.current.component(.day, from: cell.cellDate)
//        cell.titleLabel.text = "\(mo) \(dy)"
    }
    
    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
        
        if oneWeekAgo > lastLoggedInDate && oneWeekAgo < Date() {
            let color = niceOrangeLight
            cell.backgroundColor = color; cell.cellColour = color // shows up momentarily after launch on ipad mini 4, landscape
            
            if oneWeekAgo > lastLoggedInDate && oneWeekAgo <= lastLoggedInDate + TimeInterval(3600) { //&& row != nowRow && column != nowColumn
                cell.titleLabel.text = "last login"
                cell.titleLabel.font = UIFont.systemFont(ofSize: 8, weight: .ultraLight)
            }
            else {cell.titleLabel.font = defaultTimetableCellFont}
            
            if let events = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                //cell.backgroundColor = jadeGreen; cell.cellColour = jadeGreen
                if !savedTimeBlocksForProcessing {
                    if !eventArraysToProcess.contains(events) {eventArraysToProcess.append(events)}
                    if !pathsToProcess.contains([column, row]) {pathsToProcess.append([column, row])}
                }
            }
        }
    }
    
    func showNowCell(cell: CustomCell, column: Int, row: Int) {
        if row == nowRow && column == nowColumn {
            cell.layer.borderWidth = 1;     cell.layer.borderColor = icyBlue.cgColor
            cell.titleLabel.text = "now"
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
        //presentPopupViewToMarkEvents(column: column, row: row) //! // testing popup window, independent of actual condition under which it pops up
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours {cell.backgroundColor = lightNavy; cell.cellColour = lightNavy}
            weekAhead = 1
        }
        return weekAhead
    }
}


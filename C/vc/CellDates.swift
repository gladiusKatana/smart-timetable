//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout, looping: Bool, withColours: Bool) {
        showNowCell(cell: cell, column: column, row: row)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead
        processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
    }
    
    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        
        let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
        
        if oneWeekAgo > lastLoggedInDate && oneWeekAgo < Date() {           //- TimeInterval(70) { // do this with the events' dates, not cellDate
        
            cell.backgroundColor = niceOrange
            
            let filledBlockToProcess = TimeBlock(values:(column, row))
            if eventsAtIndexPath[filledBlockToProcess] != nil {
                eventsAtIndexPath[filledBlockToProcess]?.last?.eventDate = cell.cellDate    // since the cell's cell-date is now 1 week later
                eventsAtIndexPath[filledBlockToProcess]?.last?.eventStatus = .deferred
                // event status property will be set by user in a prompt, which will loop over all of the time block's events/tasks, not just .last
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
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours{cell.backgroundColor = lightNavy}
            weekAhead = 1
        }
        return weekAhead
    }
}


//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setupHourlyCellsWithoutLooping (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        showNowCell(cell: cell, column: column, row: row)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow
        
        setTitleLabels(cell: cell, column: column, row: row, layout: layout)
        modifyTimeBlockBasedOnLoginDateRange(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setupHourlyCellsWithLoopingWeeks (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        showNowCell(cell: cell, column: column, row: row)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        
        let weekAhead = setCellWeek(cell: cell, column: column, row: row, layout: layout, showWithColours: true)
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAhead)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead
        
        setTitleLabels(cell: cell, column: column, row: row, layout: layout)
        modifyTimeBlockBasedOnLoginDateRange(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout, showWithColours: Bool) -> Int {
        var weekAhead = 0
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderRows && !(row == nowRow && column == nowColumn) {
            if column < nowColumn || column == nowColumn && row < nowRow {
                if showWithColours{cell.backgroundColor = .red}
                weekAhead = 1
            }
            else {if showWithColours{cell.backgroundColor = .orange}}
        }
        return weekAhead
    }
    
    func modifyTimeBlockBasedOnLoginDateRange(cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderRows {
            if cell.cellDate > lastLoggedInDate && cell.cellDate < Date() - TimeInterval(70) {
                cell.backgroundColor = .orange
                //let timeBlock = TimeBlock(values:(column, row))
                //(upcoming: will set event's status to done, delegated, obviated, or deferred)
            }
        }
    }
    
    func showNowCell(cell: CustomCell, column: Int, row: Int) {
        if row == nowRow && column == nowColumn {
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
    }
}


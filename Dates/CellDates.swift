//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func setupHourlyCellsWithLoopingWeeks (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        var weekAhead = 0
        if row == nowRow && column == nowColumn {        // the 'now-cell'
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
            
            if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderRows {
                if column < nowColumn || column == nowColumn && row < nowRow {
                    //cell.backgroundColor = .red
                    weekAhead = 1
                }
                //else {cell.backgroundColor = .orange}
            }
        }
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        let conditionalWeekAhead = TimeInterval(86400 * 7 * weekAhead)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + conditionalWeekAhead
        
        setTitleLabels(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setupHourlyCellsWithoutLooping (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if row == nowRow && column == nowColumn {        // the 'now-cell'
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
        } else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderRows {
            if cell.cellDate > lastLoggedInDate && cell.cellDate < Date() - TimeInterval(60) {
                cell.backgroundColor = .orange
            }
        }
        setTitleLabels(cell: cell, column: column, row: row, layout: layout)
    }
}

//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func setCellDateAndText (cell: CustomCell, indexPath: IndexPath, layout: CCVFlowLayout) {
        let row = indexPath.item ; let column = indexPath.section       // since loadsHorizontally should be true for a (typical) calendar vc
        cell.titleLabel.textColor = platinum
        
        if collectionViewType == .hours {
            if loopWeeks {setupHourlyCellsWithLoopingWeeks(cell: cell, column: column, row: row, layout: layout)}
            else {setupHourlyCellsWithoutLooping(cell: cell, column: column, row: row, layout: layout)}
        }
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
        setHeaderLabels(cell: cell, column: column, row: row, layout: layout)
    }
    
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
                    cell.backgroundColor = .red
                    weekAhead = 1
                } else {
                    cell.backgroundColor = .orange
                }
            }
        }
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        let conditionalWeekAhead = TimeInterval(86400 * 7 * weekAhead)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + conditionalWeekAhead
        
        setHeaderLabels(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setHeaderLabels (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
            let dy = Calendar.current.component(.day, from: cell.cellDate)
            cell.titleLabel.text = "\(mo) \(dy)"
        }
        else {
            if column == 0 && row > 0 {
                var ampm = ""
                if row < 13 {ampm = "am"}
                else {ampm = "pm"}
                cell.titleLabel.text = "\(hoursOfTheDay[row - 1])\(ampm)"
            }
            else if row == 0 && column > 0 {
                cell.titleLabel.text = weekdaysAbbreviated[column - 1]
            }
        }
    }
}



//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func setCellDateAndText (cell: CustomCell, indexPath: IndexPath) {
        let row = indexPath.item ; let column = indexPath.section       // since loadsHorizontally should be true for a (typical) calendar vc
        
        //cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)"
        cell.titleLabel.textColor = platinum
        
        if collectionViewType == .hours {setupHourlyCells(cell: cell, column: column, row: row)}
    }
    
    
    func setupHourlyCells (cell: CustomCell, column: Int, row: Int) {
        
        if row - 1 == nowRow && column == nowColumn {           // the 'now-cell'
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
            cell.cellDate = Date()
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        
        let nowCellDate = createDate(year, monthInt: months.firstIndex(of: monthString)! + 1, dayInt: dayInt, hour: hour, minute: minute)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        
        cell.cellDate = nowCellDate + hoursFromNow + daysFromNow
        }
        
        
        if row > 0 && column == 0 {
            var ampm = ""
            if row < 13 {
                ampm = "am"
            } else {ampm = "pm"}
            cell.titleLabel.text = "\(hoursOfTheDay[row - 1])\(ampm)"
        }
        if column > 0 && row == 0 {
            cell.titleLabel.text = weekdaysAbbrev[column - 1]
        }
    }
    
}



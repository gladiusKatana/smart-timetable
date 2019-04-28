//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func setCellDateAndText (cell: CustomCell, indexPath: IndexPath, layout: CCVFlowLayout) {
        let row = indexPath.item ; let column = indexPath.section       // since loadsHorizontally should be true for a (typical) calendar vc
        
        cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)" 
        cell.titleLabel.textColor = platinum
        
        if collectionViewType == .hours {setupHourlyCells(cell: cell, column: column, row: row, layout: layout)}
    }
    
    func setupHourlyCells (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if row == nowRow && column == nowColumn {        // the 'now-cell'
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow
        setHeaderText(cell: cell, column: column, row: row, layout: layout)
    }
    
    func setHeaderText (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if column == 0 && row >= layout.lockedHeaderRows {
            var ampm = ""
            if row < 13 {
                ampm = "am"
            } else {
                ampm = "pm"
            }
            cell.titleLabel.text = "\(hoursOfTheDay[row - 1])\(ampm)"
        }
        if row == 0 && column >= layout.lockedHeaderRows {
            cell.titleLabel.text = weekdaysAbbreviated[column - 1]
        }
    }
}



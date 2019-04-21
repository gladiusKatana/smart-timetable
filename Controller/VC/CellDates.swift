//  CellText.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {
        let row = indexPath.section ; let column = indexPath.item       // since loadsHorizontally should be true for a (typical) calendar vc
//        if collectionViewType == .days {setupDailyCells(cell: cell, column: column, row: row)}
//        if collectionViewType == .months {setupMonthlyCells(cell: cell, column: column, row: row)}
//        if collectionViewType == .years {setupYearlyCells(cell: cell, column: column, row: row)}
    }
    
    
    func setupDailyCells (cell: CustomCell, column: Int, row: Int) {
        let daysFromToday = 86400 * (column - todayCellColumn + 7 * (row - todayCellRow))
        cell.cellDate = currentDate + TimeInterval(daysFromToday)
        
        if row == 0 {cell.titleLabel.text = ["S", "M", "T", "W", "T", "F", "S"][column]}    // set cell text
        else {cell.titleLabel.text = "\(dayIntOf(cell.cellDate))"}
        
        
        if monthNameOf(currentDate) == monthNameOf(Date())              // set cell colour based on whether month in view is present month
            && yearOf(currentDate) == yearOf(Date())
            && row == todayCellRow && column == todayCellColumn
        {
            cell.backgroundColor = platinumLite
        }
        else {cell.backgroundColor = cellDefaultColour}
        
        
        if monthNameOf(cell.cellDate) == monthNameOf(currentDate) {     // set cell text based on date (in this month?) & whether cell in header
            cell.titleLabel.textColor = platinum
        }
        else {
            if row == 0 {cell.titleLabel.textColor = icyBlue}
            else {cell.titleLabel.textColor = platinumLite}
        }
    }
    
    
    func setupMonthlyCells (cell: CustomCell, column: Int, row: Int) {
        let monthIndex = row * 3 + column
        
        if currentMonthIndex == row * 3 + column {
            cell.cellDate = Date()
            cell.backgroundColor = platinumLite
        }
        else {
            cell.cellDate = createDate(year, monthInt: monthIndex + 1, dayInt: 1)
            cell.backgroundColor = cellDefaultColour
        }
        cell.titleLabel.text = months[monthIndex];     cell.titleLabel.textColor = platinum
    }
    
    
    func setupYearlyCells (cell: CustomCell, column: Int, row: Int) {
        let yearlyCalendarStartingDate = 2015
        cell.cellDate = createDate(yearlyCalendarStartingDate + column + 5 * row, monthInt: 1, dayInt: 1)
        cell.titleLabel.text = "\(yearOf(cell.cellDate))";  cell.titleLabel.textColor = platinum
        
        if yearOf(cell.cellDate) == yearOf(Date()) {              // set cell colour based on whether month in view is present month
            cell.backgroundColor = platinumLite
        }
    }
}



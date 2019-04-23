//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {
        let row = indexPath.item ; let column = indexPath.section       // since loadsHorizontally should be true for a (typical) calendar vc

        cell.titleLabel.textColor = platinum
        
        if collectionViewType == .hours {setupHourlyCells(cell: cell, column: column, row: row)}
    }
    
    
    func setupHourlyCells (cell: CustomCell, column: Int, row: Int) {
        
        if row == nowRow && column == nowColumn {
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
        }
        
    }

}



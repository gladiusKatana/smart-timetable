//  CellText.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {
        let row = indexPath.section ; let column = indexPath.item       // since loadsHorizontally should be true for a (typical) calendar vc
//        if collectionViewType == .days {setupDailyCells(cell: cell, column: column, row: row)}
//        if collectionViewType == .months {setupMonthlyCells(cell: cell, column: column, row: row)}
//        if collectionViewType == .years {setupYearlyCells(cell: cell, column: column, row: row)}
        if collectionViewType == .hours {setupHourlyCells(cell: cell, column: column, row: row)}
    }
    
    
    func setupHourlyCells (cell: CustomCell, column: Int, row: Int) {
        
        
        
    }
    
//    func setupDailyCells (cell: CustomCell, column: Int, row: Int) {
//    }
//
//    func setupMonthlyCells (cell: CustomCell, column: Int, row: Int) {
//    }
//
//    func setupYearlyCells (cell: CustomCell, column: Int, row: Int) {
//    }
}



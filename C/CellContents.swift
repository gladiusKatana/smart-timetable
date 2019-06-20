//  CellContents.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setCellContents (cell: CustomCell, row: Int, column: Int, layout: CCVFlowLayout) {         //cell. titleLabel.text = "\(column),\(row)"
        
        if vcType == .hours {
            
            /*let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
             let dy = Calendar.current.component(.day, from: cell.cellDate)
             cell. titleLabel.text = "\(mo) \(dy)"*/
            
            setupHourlyCells(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: demarcateWeeksByColour)
            let cellTimeBlock = TimeBlock(values:(column, row))
            
            if let eventAtTimeBlock = eventsAtIndexPath[cellTimeBlock] {
                cell.titleLabel.text = eventAtTimeBlock.last?.eventDescription
            }
        }
            
        else if vcType == .todoList {
            cell.cellDate = selectedCellDate
            
            guard let eventAtTimeBlock = eventsAtIndexPath[previousTimeBlock] else {
                cell.titleLabel.text = "(no items yet)"; return
            }
            
            if column == 0 {cell.titleLabel.text = eventAtTimeBlock[row].eventDescription}
            else {
                cell.titleLabel.text = "\(eventAtTimeBlock[row].eventStatus)"
                cell.titleLabel.textColor = platinumLite
            }
            
        } else {print("[setCellContents(:)] unrecognized collection view type")}//not called, but will add more vcs from https://github.com/gladiusKatana/DMY-Tabs-Calendar
    }
}


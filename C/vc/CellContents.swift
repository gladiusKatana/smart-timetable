//  CellContents.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setCellContents (cell: CustomCell, row: Int, column: Int, layout: CCVFlowLayout) {         //cell. titleLabel.text = "\(column),\(row)"
        if vcType == .hours {
            setupHourlyCells(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: weekColourLegend)
            let cellTimeBlock = TimeBlock(values:(column, row))
            if eventsAtIndexPath[cellTimeBlock] != nil {
                cell.titleLabel.text = eventsAtIndexPath[cellTimeBlock]?.last?.eventDescription
            }
        } else if vcType == .todoList {                                         //print("(todo list; previous time block: \(previousTimeBlock))")
            cell.cellDate = selectedCellDate
            
            if eventsAtIndexPath[previousTimeBlock] != nil {
                if column == 0 {
                    cell.titleLabel.text = eventsAtIndexPath[previousTimeBlock]![row].eventDescription
                }
                else if column == 1 {
                    let eventDeadline = eventsAtIndexPath[previousTimeBlock]![row].eventDate
                    cell.titleLabel.text = formattedDateString(eventDeadline, comment: "", short: false)
                }
                else {cell.titleLabel.text = "\(eventsAtIndexPath[previousTimeBlock]![row].eventStatus)"}
            } else {
                cell.titleLabel.text = "(no items yet)"}
        }
        else {print("vc type is some other unknown type")}//not called, but will add more vcs from https://github.com/gladiusKatana/DMY-Tabs-Calendar
    }
    
    func setTitleLabels (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        cell.titleLabel.textColor = platinum    
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
/*see bottom - optional code to insert*/
/*let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
 let dy = Calendar.current.component(.day, from: cell.cellDate)
 cell. titleLabel.text = "\(mo) \(dy)"*/


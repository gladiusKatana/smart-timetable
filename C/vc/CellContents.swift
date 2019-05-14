//  CellContents.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setCellContents (cell: CustomCell, indexPath: IndexPath, layout: CCVFlowLayout) {
        cell.titleLabel.textColor = platinum
        let row = indexPath.item ; let column = indexPath.section

        if collectionViewType == .hours {
            if loopWeeks {setupHourlyCellsWithLoopingWeeks(cell: cell, column: column, row: row, layout: layout)}
            else {setupHourlyCellsWithoutLooping(cell: cell, column: column, row: row, layout: layout)}
            
            let timeBlock = TimeBlock(values:(column, row))
            let simpleEvent = SimpleEvent(eventDescription: defaultEmptEventDescription, eventDate: selectedCellDate)
            if eventsAtIndexPath[timeBlock] == nil {eventsAtIndexPath[timeBlock] = [simpleEvent]}
            cell.titleLabel.text = eventsAtIndexPath[timeBlock]?.last?.eventDescription
        }
        else if collectionViewType == .todoList {                            //print("(todo list; previous time block: \(previousTimeBlock) )")
            if eventsAtIndexPath[previousTimeBlock] != nil {
                cell.titleLabel.text = eventsAtIndexPath[previousTimeBlock]![row].eventDescription
            }
            else {
                cell.titleLabel.text = "no items yet"
            }
            cell.cellDate = selectedCellDate
        }
    }
    
    func setTitleLabels (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout) {
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
        /*see bottom - optional code to insert*/
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

/*let mo = months[Calendar.current.component(.month, from: cell.cellDate) - 1]
 let dy = Calendar.current.component(.day, from: cell.cellDate)
 cell. titleLabel.text = "\(mo) \(dy)"*/

/*
 //            let timeBlock = TimeBlock(values:(column, row))
 //            if let events = eventsAtIndexPath[timeBlock] {
 //                cell. titleLabel.text = events.last                      //; print("events at time block [\(column), \(row)] \(events)")
 //            }
 //            else {cell. titleLabel.text = ""}
 */

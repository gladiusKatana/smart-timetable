//  CellContents.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setCellContents (cell: CustomCell, indexPath: IndexPath, layout: CCVFlowLayout) {
        let row = indexPath.item ; let column = indexPath.section
        
        if collectionViewType == .hours {
            setupHourlyCells(cell: cell, column: column, row: row, layout: layout, looping: loopWeeks, withColours: loopWeeks)
            if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
                let timeBlock = TimeBlock(values:(column, row))
                let simpleEvent = SimpleEvent(eventDescription: defaultEmptyEventDescription, eventDate: selectedCellDate)
                if eventsAtIndexPath[timeBlock] == nil {eventsAtIndexPath[timeBlock] = [simpleEvent]}
                cell.titleLabel.text = eventsAtIndexPath[timeBlock]?.last?.eventDescription
            }
        }
        else if collectionViewType == .todoList {                               //print("(todo list; previous time block: \(previousTimeBlock) )")
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
            } else {cell.titleLabel.text = "(no items yet)"}
        }
        else {print("collection view type is some other unknown type")}         // should never get called
    }
    
    func setTitleLabels (cell: CustomCell, column: Int, row: Int, layout: CCVFlowLayout, withColours: Bool) {
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            if withColours {cell.titleLabel.textColor = .black}
            /*see bottom - optional code to insert*/
        }
        else {
            cell.titleLabel.textColor = cellTextDefaultColour
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


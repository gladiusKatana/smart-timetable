//  CellDates.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setupHourlyCells(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, looping: Bool, withColours: Bool) {
        showNowCell(cell: cell, column: column, row: row)
        
        let hoursFromNow = TimeInterval(3600 * (row - nowRow))
        let daysFromNow = TimeInterval(86400 * (column - nowColumn))
        var weekAheadInt = 0
        
        if looping {weekAheadInt = setCellWeek(cell: cell, column: column, row: row, layout: layout, withColours: withColours)}
        let potentialWeekAhead = TimeInterval(86400 * 7 * weekAheadInt)
        
        cell.cellDate = Date() + hoursFromNow + daysFromNow + potentialWeekAhead
        processEventBasedOnDateRange(cell: cell, column: column, row: row, layout: layout)
    }
    
    func processEventBasedOnDateRange(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        let oneWeekAgo = cell.cellDate - TimeInterval(86400 * 7)
        if oneWeekAgo > lastLoggedInDate && oneWeekAgo < Date() {
            
            //cell.backgroundColor = niceOrange; cell.cellColour = niceOrange // shows up momentarily after launch on ipad mini 4, landscape
            
            if eventsAtIndexPath[TimeBlock(values:(column, row))] != nil {
                
                let blockToProcessColour = jadeGreen
                cell.backgroundColor = blockToProcessColour; cell.cellColour = blockToProcessColour
                
                timeBlockPathsToProcess.append([column, row])
                
                
            }
        }
    }
    
    func showNowCell(cell: CustomCell, column: Int, row: Int) {
        if row == nowRow && column == nowColumn {
            cell.layer.borderWidth = 1;     cell.layer.borderColor = icyBlue.cgColor
            cell.titleLabel.text = "now"
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { //time delay of 0.3 works stably (thus far) on my iPhone 7
//
//                let layout = self.downcastLayout!
//                let cellWidth = layout.widthPlusSpace; let cellHeight = layout.heightPlusSpace
//
//                let ex = cellWidth * CGFloat(column + 1)
//                let wye = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
//
//                let frame = CGRect(x: ex, y: wye, width: cellWidth, height: cellHeight * 2)
//
//                classifierVC.downcastLayout?.customFrame = frame
//                classifierVC.collectionView.frame = frame
//
//                let classifierLayout = classifierVC.downcastLayout!
//
//                classifierLayout.cellWidth = cellWidth
//                classifierLayout.cellHeight = cellHeight             //; print("classifier vc will be added at \(frame)")
//
//                //if !removedPopup {
//                self.view.addSubview(classifierVC.view)
//                //globalKeyWindow.addSubview(classifierVC.view)
//                // }
//            }
            
            
        }
        else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
    }
    
    func setCellWeek(cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout, withColours: Bool) -> Int {
        var weekAhead = 0
        if column < nowColumn || column == nowColumn && row < nowRow {
            if withColours {cell.backgroundColor = lightNavy; cell.cellColour = lightNavy}
            weekAhead = 1
        }
        return weekAhead
    }
}


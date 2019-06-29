//  IndexPathToCell.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item; let column = indexPath.section
        cell.xyCoordinate = [column, row]
        
        if row < 1 || column < 1 {
            setCellColours(cell: cell, cellIsInHeader: true)
            setTimeAndDayLabels(cell: cell, column: column, row: row, layout: customLayout)
        }
        else {
            setCellColours(cell: cell, cellIsInHeader: false)
            setCellContents(cell: cell, row: row, column: column, layout: customLayout)
            
//            if row == customLayout.rows - 1 && column == customLayout.cols - 1 {        //print("paths to process: \(timeBlockPathsToProcess)")
//                if timeBlockPathsToProcess.count > 0 {
//                    processEventsSinceLastLogin(layout: customLayout)
//                }
//            }
        }
        return cell
    }
    
    func setCellColours (cell: CustomCell, cellIsInHeader: Bool) {
        if cellIsInHeader {
            cell.backgroundColor = headerColour
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.titleLabel.textColor = platinum
        }
        else { guard cell.xyCoordinate != selectedTimeBlockPath else {
            cell.backgroundColor = halfIcyBlue; return
            }
            cell.backgroundColor = cellDefaultColour; cell.cellColour = cellDefaultColour
            animateCellColourBack(cell:cell, originalColour: cell.cellColour)
            cell.titleLabel.textColor = cellTextDefaultColour
        }
    }
    
    func setTimeAndDayLabels (cell: CustomCell, column: Int, row: Int, layout: CustomFlowLayout) {
        if column == 0 && row > 0 {
            var ampm = ""; if row < 13 {ampm = "am"} else {ampm = "pm"}
            cell.titleLabel.text = "\(hoursOfTheDay[row - 1])\(ampm)"
        }
        else if row == 0 && column > 0 {cell.titleLabel.text = weekdaysAbbreviated[column - 1]}
    }
}


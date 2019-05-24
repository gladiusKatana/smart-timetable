//  IndexPathToCell.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        
        let row = indexPath.item; let column = indexPath.section
        
        eventField.becomeFirstResponder()
        
        cellTextDefaultColour = platinum
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            setTitleLabels(cell: cell, column: column, row: row, layout: customLayout)
        }
        else {cell.titleLabel.textColor = cellTextDefaultColour}
        
        setCellColours(cell: cell, row: row, column: column, layout: customLayout)
        setCellContents(cell: cell, row: row, column: column, layout: customLayout)
        return cell
    }
    
    func setCellColours (cell: CustomCell, row: Int, column: Int, layout: CCVFlowLayout) {
        if row < layout.lockedHeaderRows || column < layout.lockedHeaderSections {
            cell.backgroundColor = headerColour
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
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


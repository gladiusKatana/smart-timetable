//  CellForItem.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        
        let row = indexPath.item; let column = indexPath.section
        
        eventField.becomeFirstResponder()
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            setTitleLabels(cell: cell, column: column, row: row, layout: customLayout)
        }
        
        if weekColourLegend {cellTextDefaultColour = .black}
        
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
}


//  CellForItem.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        
        eventField.becomeFirstResponder()
        
        let row = indexPath.item ; let column = indexPath.section       // since loadsHorizontally should be true for a (typical) calendar vc
        
        let timeBlock = TimeBlock(values:(column, row))
        
        if eventsAtIndexPath[timeBlock] == nil {eventsAtIndexPath[timeBlock] = [""]} //\(indexPath)
        
        cell.titleLabel.text = eventsAtIndexPath[timeBlock]?.last
        //cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)" ; //print(".", terminator: "")
        
        setCellColours(cell: cell, indexPath: indexPath, layout: customLayout)
        setCellContents(cell: cell, indexPath: indexPath, layout: customLayout)
        return cell
    }
    
    
    func setCellColours (cell: CustomCell, indexPath: IndexPath, layout: CCVFlowLayout) {
        let row = indexPath.item; let column = indexPath.section
        
        if row < layout.lockedHeaderRows || column < layout.lockedHeaderSections {
            cell.backgroundColor = headerColour
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
    }
}


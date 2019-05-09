//  Selecting.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        /*if indexPath.item >= customLayout.lockedHeaderRows && indexPath.section >= customLayout.lockedHeaderSections { print("\nselected date (unformatted gmt)  \(cell.cellDate)")
         print(formattedDateString(cell.cellDate, comment: "                 (formatted)    "))}*/
        let customLayout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section
        
        selectedCellDate = cell.cellDate
        let dateString = formattedDateString(selectedCellDate, comment: "New event on", short: false)
        
        if collectionViewType == .hours {
            
            selectedTimeBlockPath = [column, row]
            timeBlock = TimeBlock(values:(column, row))
            
            previousSelectedTimeBlockPath = [column, row]
            previousTimeBlock = TimeBlock(values:(column, row))
            
            if eventsAtIndexPath[timeBlock] == nil {
                formatAndPresentTextField(customLayout: customLayout, dateString: dateString)
                textFieldDisplayed = true
            }
            else {gotoView(vc: todoListVC)}
            
            if !cell.markedForItems {
                UIView.animate(withDuration: 1, delay: 0,
                               usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                                cell.backgroundColor = .black
                }, completion: nil)
                cell.markedForItems = true
            }
            else {
                cell.backgroundColor = niceOrange
                UIView.animate(withDuration: 1, delay: 0,
                               usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                                cell.backgroundColor = cell.cellColour
                }, completion: nil)
            }
        }
        else if collectionViewType == .todoList {
            formatAndPresentTextField(customLayout: customLayout, dateString: dateString)
            textFieldDisplayed = true
        }
        else {print("unrecognized collection view cell type selected")}
    }
}


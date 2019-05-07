//  UserInput.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let row = indexPath.item ; let column = indexPath.section
        let customLayout = downcastLayout!
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
         
         /*if indexPath.item >= customLayout.lockedHeaderRows && indexPath.section >= customLayout.lockedHeaderSections {
         print("\nselected date (unformatted gmt)  \(cell.cellDate)")
         print(formattedDateString(cell.cellDate, comment: "                 (formatted)    "))
         }*/
        
        selectedPath = [column, row]
        let timeBlock = TimeBlock(values:(column, row))
        
        let dateString = formattedDateString(cell.cellDate, comment: "New event on")
        
        if eventsAtIndexPath[timeBlock] == nil {
            formatAndPresentTextField(customLayout: customLayout, dateString: dateString)
        }
        else {
            print("will present to-do list for this time block")
        }
        
        textFieldDisplayed = true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.removeFromSuperview(); textFieldDisplayed = false
        
        let text = textField.text!                                                  //; print("text: \(text)")
        addToPairMap(column: selectedPath[0], row: selectedPath[1], text: text)
        reloadCV()
        return true
    }
}


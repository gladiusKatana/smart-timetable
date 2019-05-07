//  UserInput.swift
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
        let dateString = formattedDateString(selectedCellDate,
                                             comment: "New event on", short: false)
        selectedPath = [column, row]
        timeBlock = TimeBlock(values:(column, row))
        
        if collectionViewType == .hours {
            previousSelectedPath = [column, row]
            previousTimeBlock = TimeBlock(values:(column, row))
            if eventsAtIndexPath[timeBlock] == nil {
                formatAndPresentTextField(customLayout: customLayout, dateString: dateString)
                textFieldDisplayed = true
            }
            else {gotoView(vc: todoListVC)}
        }
        else if collectionViewType == .todoList {
            formatAndPresentTextField(customLayout: customLayout, dateString: dateString)
            textFieldDisplayed = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.removeFromSuperview(); textFieldDisplayed = false
        let text = textField.text!
        
        if text != "" {
            if collectionViewType == .hours {                                                              //; print("text: \(text)")
                addToTimeBlocks(column: selectedPath[0], row: selectedPath[1], text: text)
                reloadCV()
            }
            else if collectionViewType == .todoList {       //print("selected time block: \([previousSelectedPath[0], previousSelectedPath[1]])")
                addToTimeBlocks(column: previousSelectedPath[0], row: previousSelectedPath[1], text: text)
                gotoView(vc: todoListVC)
            }
            else {
                print("collection view is not a recognized type")
            }
        }
        
        return true
    }
}


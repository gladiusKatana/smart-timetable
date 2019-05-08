//  TextField.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func rePresentTextField() {                     //print("rePresent")
        if textFieldDisplayed {
            eventField.removeFromSuperview()        //; print("removed")
            
            let customLayout = downcastLayout!
            
            formatAndPresentTextField(customLayout: customLayout, dateString: eventField.placeholder!)
        }
    }
    
    func formatAndPresentTextField(customLayout: CCVFlowLayout, dateString: String) {   // may remove argument  customLayout
        let fieldWidth = CGFloat(325)
        let fieldHeight = CGFloat(2 * timetableLayout.cellHeight!)
        let halfWidth = (timetableLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2

        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
        
        view.addSubview(eventField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.removeFromSuperview(); textFieldDisplayed = false
        let text = textField.text!
        
        if text != "" {
            if collectionViewType == .hours {                                                              //; print("text: \(text)")
                addToTimeBlocks(column: pathToTimeBlockForAddingAToDo[0], row: pathToTimeBlockForAddingAToDo[1], text: text)
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


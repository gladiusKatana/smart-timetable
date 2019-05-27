//  TextField.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func rePresentTextField() {                     //print("rePresent")
        if textFieldDisplayed {
            eventField.removeFromSuperview()        //; print("removed")
            let customLayout = downcastLayout!
            formatAndPresentTextField(layout: customLayout, dateString: eventField.placeholder!)
        }
    }
    
    func formatAndPresentTextField(layout: CCVFlowLayout, dateString: String) {   // may remove argument  customLayout
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
        let textEntered = textField.text!
        
        if textEntered != "" {
            if vcType == .hours {                                                              //; print("text: \(text)")
                addToTimeBlocks(column: selectedTimeBlockPath[0], row: selectedTimeBlockPath[1], textEntered: textEntered)
                reloadCV()
            }
            else if vcType == .todoList {       //print("selected time block: \([previousSelectedPath[0], previousSelectedPath[1]])")
                addToTimeBlocks(column: previousSelectedTimeBlockPath[0], row: previousSelectedTimeBlockPath[1], textEntered: textEntered)
                gotoView(vc: todoListVC) // essentially reloads the view to display the updated list
            }
            else {
                print("collection view is not a recognized type")
            }
            textField.text = ""
        }
        return true
    }
}


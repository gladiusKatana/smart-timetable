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
    
    
    func formatAndPresentTextField(customLayout: CCVFlowLayout, dateString: String) {
        let fieldWidth = CGFloat(350)
        let fieldHeight = CGFloat(2 * customLayout.cellHeight!)
        let halfWidth = (customLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2

        eventField.placeholder = dateString
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
        
        view.addSubview(eventField)
    }
}


//  TextField.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    
    func rePresentTextField() {                     //print("rePresent")
        if textFieldDisplayed {
            eventField.removeFromSuperview()        //; print("removed")
            
            let customLayout = downcastLayout!
            
            formatAndPresentTextField(customLayout: customLayout)
        }
    }
    
    
    func formatAndPresentTextField(customLayout: CCVFlowLayout) {
        let fieldWidth = CGFloat(300)
        let fieldHeight = CGFloat(2 * customLayout.cellHeight!)
        let halfWidth = (customLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
        
        eventField.text = eventField.placeholder
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
        
        view.addSubview(eventField)
    }
}


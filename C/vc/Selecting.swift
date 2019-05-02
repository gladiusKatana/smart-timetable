//  Selecting.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        
        if indexPath.item >= customLayout.lockedHeaderRows && indexPath.section >= customLayout.lockedHeaderSections {
            print("\nselected date (unformatted gmt)  \(cell.cellDate)")
            print(formattedDateString(cell.cellDate, comment: "                 (formatted)    "))
        }
        selectedPath = [indexPath.section, indexPath.row]

        let fieldWidth = CGFloat(300); let fieldHeight = CGFloat(2 * customLayout.cellHeight!)
        let halfWidth = (customLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
        let barsHeight = CGFloat(statusBarHeight + navBarHeight) + 2 * fieldHeight
        
        eventField.text = eventField.placeholder
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: barsHeight, width: 300, height: fieldHeight)
        view.addSubview(eventField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        
        let text = textField.text!                                                  //; print("text: \(text)")
        addToPairMap(column: selectedPath[0], row: selectedPath[1], text: text)
        reloadCV()
        return true
    }
}

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("text: \(textField.text!) (ended editing)")
//    }

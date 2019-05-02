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
        
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        sampleTextField.placeholder = "Enter text"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.isEnabled = true
        sampleTextField.delegate = self
        view.addSubview(sampleTextField)
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

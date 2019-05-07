//  CollectionVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

class CollectionVC: UICollectionViewController, UITextFieldDelegate {
    
    var downcastLayout : CCVFlowLayout?;    var collectionViewType = CollectionViewType.days
    var colourIndex: Int = Int();           var loopWeeks = false
    
    lazy var eventField: UITextField = {
        let eventField =  UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        eventField.font = UIFont.systemFont(ofSize: 15)
        eventField.borderStyle = UITextField.BorderStyle.roundedRect
        eventField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        eventField.clearsOnBeginEditing = true
        eventField.keyboardType = UIKeyboardType.default
        eventField.returnKeyType = UIReturnKeyType.done
        eventField.autocorrectionType = UITextAutocorrectionType.no
        eventField.clearButtonMode = UITextField.ViewMode.whileEditing
        eventField.isEnabled = true
        return eventField
    }()
    
    init(_ collectionViewType: CollectionViewType, loopWeeks: Bool, colourIndex: Int, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.collectionViewType = collectionViewType
        self.loopWeeks = loopWeeks
        self.colourIndex = colourIndex
        self.downcastLayout = layout as? CCVFlowLayout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        eventField.becomeFirstResponder()
        
        setCellColours(cell: cell, indexPath: indexPath, layout: customLayout)
        setCellContents(cell: cell, indexPath: indexPath, layout: customLayout)
        //cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)" ; //print(".", terminator: "")
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

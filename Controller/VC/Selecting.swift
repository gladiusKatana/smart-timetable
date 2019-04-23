//  Selecting.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        
        if collectionViewType == .days {
            
            print(formalDateString(cell.cellDate, comment: "selected day-cell date:"))
        }
        else {
            
            if collectionViewType == .months {
                print(formalDateString(cell.cellDate, comment: "selected month-cell date:"))
            }
            else {
                print(formalDateString(cell.cellDate, comment: "selected year-cell date:"))
            }
            
            currentDate = cell.cellDate
            processCurrentDate()
            presentViaVCButton(vc: daysVC)
        }
        
    }
}

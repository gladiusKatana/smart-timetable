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
        
        //launching on iPhone 7 ...in portrait orientation      // prototype strings to interpolate for cleaner console prints
        //                      ...on date
        
        //last login    (unformatted gmt)  //
        //selected date (unformatted gmt)  //
        
        //last login       (formatted)    //
        //selected date    (formatted)    //
        //                 (formatted)    //
        //                 (formatted)    //

    }
}

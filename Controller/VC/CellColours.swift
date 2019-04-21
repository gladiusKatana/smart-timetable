//  CellColours.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setCellColours (cell: CustomCell, indexPath: IndexPath) {
        
        let row = indexPath.item; let column = indexPath.section
        
        let customLayout = downcastLayout!
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            cell.backgroundColor = headerColour
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
    }
}



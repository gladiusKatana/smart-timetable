//  ZIndex.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CustomFlowLayout {
    
    func determineZIndex(row: Int, section: Int, cellAttributes: UICollectionViewLayoutAttributes) {    // lockedHeaderSections = lockedHeaderRows
        
        if row < lockedHeaderRows {
            cellAttributes.zIndex = 3
        }
        
        if section < lockedHeaderSections {
            cellAttributes.zIndex = 3
        }
        
        if section < lockedHeaderSections && row < lockedHeaderRows {
            cellAttributes.zIndex = 4
        }
        
    }
    
}


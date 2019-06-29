//  PopupSelection.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            
//             let row = timeBlockPathsToProcess.last![1]
//             let column = timeBlockPathsToProcess.last![0]
//             
//             if let eventAtTimeBlock = eventsAtIndexPath[TimeBlock(values:(column, row))] {
//             
//             if eventAtTimeBlock.count == 1 {
//             //                    eventAtTimeBlock.last!.eventDate =
//             eventAtTimeBlock.last!.eventStatus = EventStatus(rawValue: row - 1)!
//             print("status entered: \(eventAtTimeBlock.last!.eventStatus)")
//             }
//             
//             timeBlockPathsToProcess.removeLast()
//             //                eventMarkerVC.view.removeFromSuperview()                    ; print("marked item as: \(EventStatus.allCases[row - 1])")
//             }
            
            if let eventStatusString = cell.titleLabel.text {
                print("selected event status \(eventStatusString)")
            }
            
            
        } else {
            print("selected header")
        }
    }
}


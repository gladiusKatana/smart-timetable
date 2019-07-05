//  PopupSelect.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        //let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let currentColumn = pathsToProcess.first![0]; let currentRow = pathsToProcess.first![1] // ie, current index path being processed
            
            if let eventsAtTimeBlock = eventsAtIndexPath[TimeBlock(values:(currentColumn, currentRow))] {
                
                if eventsAtTimeBlock.count == 1 {
                    eventsAtTimeBlock.last!.eventStatus = EventStatus(rawValue: row - 1)!
                    print("status entered: \(eventsAtTimeBlock.last!.eventStatus)")
                }
            }
            
            pathsToProcess.removeFirst()            //; print("now paths to process: \(pathsToProcess)")
            
            classifierVC.view.removeFromSuperview()
            
            if !pathsToProcess.isEmpty {
                timetableVC.processEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
            }
            
        } else {
            print("selected header")
        }
    }
}


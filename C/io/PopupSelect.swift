//  PopupSelect.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

var item = 0

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        //let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!
        let row = indexPath.item;   let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            let currentColumn = pathsToProcess.first![0]; let currentRow = pathsToProcess.first![1]     // ie, current item path being marked
            
            if let events = eventsAtIndexPath[TimeBlock(values:(currentColumn, currentRow))] {          // writing to the dictionary
                
                print("marked events[\(item)]: EventStatus[\(row - 1)]")
                
                events[item].eventStatus = EventStatus(rawValue: row - 1)!      ; print("marked events[\(item)] as \(events[item].eventStatus)")
            }
            else {print("no item")}
            
            if item < eventsInBlockToBeProcessed {
                item += 1
            }
            
            if eventsInBlockToBeProcessed > 0 {
                eventsInBlockToBeProcessed -= 1
            }
            
            if eventsInBlockToBeProcessed == 0 {
                pathsToProcess.removeFirst()
                eventArraysToProcess.removeFirst()
                
                item = 0
                if !eventArraysToProcess.isEmpty {
                    eventsInBlockToBeProcessed = eventArraysToProcess.first!.count
                }
                else {
                    eventsInBlockToBeProcessed = 0
                }
            }
            
            print("block events remaining now: \(eventsInBlockToBeProcessed)\n")
            print("now paths to process: \(pathsToProcess)")
            
            classifierVC.view.removeFromSuperview()
            
            timetableVC.processEventsSinceLastLogin(layout: timetableVC.downcastLayout!)
            
        } else {
            print("selected header")
        }
    }
}


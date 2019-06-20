//  TagEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let layout = downcastLayout!
        let rowSelected = indexPath.item;   let columnSelected = indexPath.section
        //        if indexPath.item >= layout.lockedHeaderRows && indexPath.section >= layout.lockedHeaderSections {
        //            print("\nselected date (unformatted gmt)  \(cell.cellDate)")
        //            print(formattedDateString(cell.cellDate, comment: "                 (formatted)    ", short: false))
        //        }
        
        if rowSelected >= layout.lockedHeaderRows && columnSelected >= layout.lockedHeaderSections {
            selectedCellDate = cell.cellDate
            let dateString = formattedDateString(selectedCellDate, comment: "New event on", short: false)
            
            if vcType == .hours {
                
                selectedTimeBlockPath = [columnSelected, rowSelected]
                timeBlock = TimeBlock(values:(columnSelected, rowSelected))
                
                previousSelectedTimeBlockPath = [columnSelected, rowSelected]
                previousTimeBlock = TimeBlock(values:(columnSelected, rowSelected))
                
                if eventsAtIndexPath[timeBlock] == nil {
                    formatAndPresentTextField(layout: layout, dateString: dateString)
                    textFieldDisplayed = true
                }
                else {gotoView(vc: todoListVC)}
                
                if !cell.markedForItems {
                    UIView.animate(withDuration: 1, delay: 0,// will factor/put in Animations.swift
                                   usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                                    cell.backgroundColor = halfIcyBlue
                    }, completion: nil)
                    cell.markedForItems = true
                }
            }
            else if vcType == .todoList {
                formatAndPresentTextField(layout: layout, dateString: dateString)
                textFieldDisplayed = true
            }
            else {print("unrecognized collection view type's cell selected")}
        }
        
        if vcType == .eventClassifier {                                     //print("event type cell \(row)")
            let row = timeBlockPathsToProcess.last![1]
            let column = timeBlockPathsToProcess.last![0]
            
            if let eventAtTimeBlock = eventsAtIndexPath[TimeBlock(values:(column, row))] {
                
                if eventAtTimeBlock.count == 1 {
//                    eventAtTimeBlock.last!.eventDate =
                    eventAtTimeBlock.last!.eventStatus = EventStatus(rawValue: rowSelected - 1)!
                    print("status entered: \(eventAtTimeBlock.last!.eventStatus)")
                }
                
                timeBlockPathsToProcess.removeLast()
                eventMarkerVC.view.removeFromSuperview()                    ; print("marked item as: \(EventStatus.allCases[rowSelected - 1])")
            }
        }
    }
}


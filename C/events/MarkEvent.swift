//  MarkEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    func processEventsSinceLastLogin(layout: CustomFlowLayout) {
        let row = timeBlockPathsToProcess.last![1]
        let column = timeBlockPathsToProcess.last![0]
        
        if let eventAtTimeBlock = eventsAtIndexPath[TimeBlock(values:(column, row))] {
            
            //if eventAtTimeBlock.count == 1 {
//                presentVcToClassifyEvents(row: row, column: column, layout: layout)
                globalEventIdentifier = "\(eventAtTimeBlock[0].eventDescription)"
            //}

        }
        else {print("could not initialize event at this index path")}
    }
    
//    func presentVcToClassifyEvents(row: Int, column: Int, layout: CustomFlowLayout) {
//        eventMarkerStartingX = 0
//        eventMarkerStartingY = CGFloat(navBarHeight + statusBarHeight) // - statusBarDelta
//
//        //while !timeBlockPathsToProcess.isEmpty {
//        if !timeBlockPathsToProcess.isEmpty {
//            /**/
//            let wid = CGFloat(130)
//
//            eventMarkerVC.collectionView?.frame = CGRect(x: eventMarkerStartingX + layout.cellWidth! * CGFloat(column + 1),
//                                                        y: eventMarkerStartingY + layout.cellHeight! * CGFloat(row),
//                                                        width: wid, height: eventMarkerLayout.cellHeight! * 3)
//
//            eventMarkerVC.downcastLayout?.cellHeight = eventMarkerLayout.cellHeight //timetableVC.downcastLayout?.cellHeight
//            eventMarkerVC.downcastLayout?.cellWidth = wid                           //eventMarkerLayout.cellWidth
//            //timetableVC.downcastLayout!.cellWidth! * 2// makes *timetableVC's* header rows become incorrectly positioned (fixed by a reload-data)
//
//            topVC = eventMarkerVC
//
//            globalKeyWindow.addSubview(eventMarkerVC.view)  //self.view.addSubview(eventMarkerVC.view)
//
//            topVC = timetableVC
//
//        } //else {print("time block paths... empty")}
//    }
}

/*if column < 5 {  eventMarkerStartingX = cell.frame.minX}
 else {                              eventMarkerStartingX = cell.frame.minX - 2 * layout.cellWidth!}
 if row <= 18 {    eventMarkerStartingY = cell.frame.minY + layout.cellHeight! + 64}
 else {                              eventMarkerStartingY = cell.frame.minY - 9 * layout.cellHeight! + 64}*/

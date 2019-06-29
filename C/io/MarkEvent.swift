//  MarkEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    func presentPopupViewToMarkEventsSinceLastLogin(column: Int, row: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { //time delay of 0.3 works stably (thus far) on my iPhone 7
            
            let layout = self.downcastLayout!
            let cellWidth = layout.widthPlusSpace;      let cellHeight = layout.heightPlusSpace
            
            let classifierLayout = classifierVC.downcastLayout!
            classifierLayout.cellWidth = cellWidth * 2;  classifierLayout.cellHeight = cellHeight
            
            let cols = CGFloat(classifierLayout.cols)
            
            let x = cellWidth * CGFloat(column + 1)
            let y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
            
            let frame = CGRect(x: x, y: y, width: cellWidth * cols * 2, height: cellHeight * 4)
            
            classifierVC.downcastLayout?.customFrame = frame
            classifierVC.collectionView.frame = frame
            
            //if !removedPopup {
            self.view.addSubview(classifierVC.view)
            classifierVC.keepScrollIndicatorsVisible()
            //globalKeyWindow.addSubview(classifierVC.view)
            // }
        }
    }
    
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
}

//        //while !timeBlockPathsToProcess.isEmpty {
//        if !timeBlockPathsToProcess.isEmpty {

/*if column < 5 {  eventMarkerStartingX = cell.frame.minX}
 else {                              eventMarkerStartingX = cell.frame.minX - 2 * layout.cellWidth!}
 if row <= 18 {    eventMarkerStartingY = cell.frame.minY + layout.cellHeight! + 64}
 else {                              eventMarkerStartingY = cell.frame.minY - 9 * layout.cellHeight! + 64}*/

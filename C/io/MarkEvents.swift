//  MarkEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    func processEventsSinceLastLogin(layout: CustomFlowLayout) {
        
        if pathsToProcess.count > 0 {
            let column = pathsToProcess.first![0]; let row = pathsToProcess.first![1]
            
            if !pathsToProcess.isEmpty {
                presentPopupViewToMarkEvents(column: column, row: row)
            }
            //globalEventIdentifier = "\(eventsToProcess.last!.last!.eventDescription)"     //; print("event identifier: \(globalEventIdentifier)")
        }
    }
    
    func presentPopupViewToMarkEvents(column: Int, row: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { //time delay of 0.3 works stably (thus far) on my iPhone 7
            
            let layout = self.downcastLayout!
            let cellWidth = layout.widthPlusSpace;      let cellHeight = layout.heightPlusSpace
            
            let widthMultiplier = CGFloat(2)
            
            let classifierLayout = classifierVC.downcastLayout!
            classifierLayout.cellWidth = cellWidth * widthMultiplier;  classifierLayout.cellHeight = cellHeight
            
            let cols = CGFloat(classifierLayout.cols)
            
            let x = cellWidth * CGFloat(column + 1)
            let y = CGFloat(navBarHeight + statusBarHeight) + cellHeight * CGFloat(row)
            
            let frame = CGRect(x: x, y: y, width: cellWidth * cols * widthMultiplier, height: cellHeight * 5)
            
            classifierVC.downcastLayout?.customFrame = frame
            classifierVC.collectionView.frame = frame
            
            ///if !removedPopup {
            self.view.addSubview(classifierVC.view)             //; print("paths to process: \(pathsToProcess)")
            classifierVC.keepScrollIndicatorsVisible()
        }
    }
}

/*if column < 5 {  eventMarkerStartingX = cell.frame.minX}
 else {                              eventMarkerStartingX = cell.frame.minX - 2 * layout.cellWidth!}
 if row <= 18 {    eventMarkerStartingY = cell.frame.minY + layout.cellHeight! + 64}
 else {                              eventMarkerStartingY = cell.frame.minY - 9 * layout.cellHeight! + 64}*/


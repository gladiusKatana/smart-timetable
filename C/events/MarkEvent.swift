//  MarkEvent.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    func setupEventTypeList(cell: CustomCell, column: Int, row: Int) {
        cell.titleLabel.textColor = eventTextBlue
        if row == 0 {
            cell.backgroundColor = icyBlue
            cell.titleLabel.text = "Mark '\(globalEventIdentifier)': ➡️"
        } else {
            cell.backgroundColor = .lightGray
            cell.titleLabel.text = EventStatus.allCases[row - 1].caseName() //"\(row)"
        }
    }
    
    func presentVcToClassifyEvents(layout: CCVFlowLayout) {
//        for path in timeBlockPathsToProcess {                           //print("path to process: \(path)")
//            //...
//        }

        eventMarkerStartingX = 0
        eventMarkerStartingY = CGFloat(navBarHeight + statusBarHeight)   // - statusBarDelta
        
        //while !timeBlockPathsToProcess.isEmpty {
        if !timeBlockPathsToProcess.isEmpty {
            
            let row = timeBlockPathsToProcess.last![1]
            let column = timeBlockPathsToProcess.last![0]
            
            /*if column < 5 {  eventMarkerStartingX = cell.frame.minX}
             else {                              eventMarkerStartingX = cell.frame.minX - 2 * layout.cellWidth!}
             if row <= 18 {    eventMarkerStartingY = cell.frame.minY + layout.cellHeight! + 64}
             else {                              eventMarkerStartingY = cell.frame.minY - 9 * layout.cellHeight! + 64}*/
            
            
            eventMarkerVC.collectionView?.frame = CGRect(x: eventMarkerStartingX + layout.cellWidth! * CGFloat(column - 2),
                                                        y: eventMarkerStartingY + layout.cellHeight! * CGFloat(row),
                                                        width: eventMarkerLayout.cellWidth!, height: eventMarkerLayout.cellHeight! * 3)
            
            eventMarkerVC.downcastLayout?.cellWidth = eventMarkerLayout.cellWidth    //layout.cellWidth! * 2     //
            eventMarkerVC.downcastLayout?.cellHeight = eventMarkerLayout.cellHeight  //layout.cellHeight
            
            topVC = eventMarkerVC
            self.view.addSubview(eventMarkerVC.view)
            topVC = timetableVC
            
        } //else {print("time block paths... empty")}
    }
    
    @objc func showScrollIndicatorsInContacts() {
        UIView.animate(withDuration: 0.01) {
            self.collectionView?.flashScrollIndicators()
        }
    }
    
    func startTimerForShowScrollIndicator() {
        timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showScrollIndicatorsInContacts), userInfo: nil, repeats: true)
    }
}

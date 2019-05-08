//  GoToVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                           //print("\nshowing vc \(vc)")
        
        if topVC != vc || !rePresentedVCFromButton {
            
            
            if vc == todoListVC {                                               //print("time block being tested: \(timeBlock)")
                if eventsAtIndexPath[previousTimeBlock] != nil {
                    todoListVC.downcastLayout!.rows = eventsAtIndexPath[previousTimeBlock]!.count
                }
            }
            
            
            //if currentOrientation == "landscape" {
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            //
            //} else {
            //setupAndPresent(vc: vc)
            //}
            
            
        } else {
            print("you're already looking at the \(vc.collectionViewType)-view   nav'd by button?\(rePresentedVCFromButton)")//collectionViewType
        }
    }
}


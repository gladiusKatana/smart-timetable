//  GoToVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                       //print("\nshowing vc \(vc)")
        
        if currentTopVC != vc {
            
            //if currentOrientation == "landscape" {
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                reloadWithDelay(after: 0.02)
            }
            //
            //} else {
            //setupAndPresent(vc: vc)
            //}
            
        } else {
            print("you're already looking at the \(vc.collectionViewType)-view")//collectionViewType
        }
    }
}


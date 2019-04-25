//  Load&Appear.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        
        setupNotificationForStatusBarHeightChange()
        setTopViewController()
        print("\n💾\(collectionViewType)-view loaded")
        
        //checkDatePeriodically()

        checkDtPeriodically(){kickoffTimer()}       // if you want to check the date then do the timer kickoff ('start on the 0th callback')
//        kickoffTimer()                            // if you want to do the timer kickoff then check the date ('start on the 1st callback')
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionViewType == .hours {
            setupViewTitle("Timetable", numLines: 1, alignment: .left)
        }
        
        if rePresentedVCFromButton {
            rePresentedVCFromButton = false
            reloadCV()                       
            print("💾\(collectionViewType)-view appeared")
        } //above method called early (before actually appears) to print on first appearance + avoid an additional reset of rePresentedVCFromButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTopViewController()
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
    }
    
    
    
    //    func checkDatePeriodically() {
    //        print("check date")
    //        resetTimer(closure: { [weak self] () -> () in
    //            self?.checkDatePeriodically()
    //        })
    //    }
    //
    //    func resetTimer(closure:()->()) {
    //        print("reset timer")
    //        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1.0) { [weak self] in
    //            self?.checkDatePeriodically()
    //        }
    //    }
    
    
    
    func checkDtPeriodically(completion: () -> ()) {
        print("check the dte")
        completion()
    }
    
    func kickoffTimer() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 4.0) { [weak self] in
            print("reset the tmr")
            self?.checkDtPeriodically(){self!.kickoffTimer()}
        }
    }
    
}

//        if "\(Date())".contains(":00") {print("the hour ticked over")}



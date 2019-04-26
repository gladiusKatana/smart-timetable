//  Load&Appear.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        
        if collectionViewType != .initial {
            print("\n💾\(collectionViewType)-view loaded")
            setTopViewController()
        }
        
        checkDatePeriodically(){kickoffTimer()}       // if you want to check the date then do the timer kickoff ('start on the 0th callback')
        //kickoffTimer()                              // if you want to do the timer kickoff then check the date ('start on the 1st callback')
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionViewType == .hours {
            setupViewTitle("Timetable", numLines: 1, alignment: .left)
        }
        
        if rePresentedVCFromButton {
            rePresentedVCFromButton = false
            reloadCV(); print("🏞\(collectionViewType)-view appeared")
        } //above method called early (before actually appears) to print on first appearance + avoid an additional reset of rePresentedVCFromButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTopViewController()
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
    }
    
    func checkDatePeriodically(completion: () -> ()) {                                                  //print("\(Date())")
        if "\(Date())".contains(":00:") {                                                               //print("the hour ticked over")
            if !reloadedFromHourTickingOver {
                DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                    self?.reloadCV()
                }
                reloadedFromHourTickingOver = true
            } else {
                reloadedFromHourTickingOver = false
            }
        }
        completion()
    }
    
    func kickoffTimer() {                                                                               //print(Date())//print("·")
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.checkDatePeriodically(){self!.kickoffTimer()}
        }
    }
}



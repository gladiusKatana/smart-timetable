//  ViewLifecycle.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    override func viewDidLoad() {
        collectionView.backgroundColor = windowBackgroundColour // overrides the UIWindow's background colour (speaking visually of course)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        
        if vcType != .initial && vcType != .eventClassifier {
            print("\n💾\(vcType)-view")                 // loaded
            setTopViewController()
        }
        
        checkDatePeriodically(){kickoffTimer()}         // if you want to check the date then do the timer kickoff ('start on the 0th callback')
        //kickoffTimer()                                // if you want to do the timer kickoff then check the date ('start on the 1st callback')
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if vcType == .hours {
            setupViewTitle("Timetable", numLines: 1, alignment: .left)
        }
        else { //if vcType == .todoList {
            setupViewTitle(formattedDateString(selectedCellDate, comment: "", short: false), numLines: 1, alignment: .left)
        }
        
        if rePresentedVCFromButton {
            rePresentedVCFromButton = false
            reloadCV(); print("🏞\(vcType)-view")       // appeared
        } //above method called early (before actually appears) to print on first appearance + avoid an additional reset of rePresentedVCFromButton
    }
    
    
    override func viewDidAppear(_ animated: Bool) {     //print("path to time block\(selectedTimeBlockPath)")
        if vcType != .eventClassifier {
            setTopViewController()
        }
//        else {
//            topVC = eventMarkerVC
//        }
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
        
        if vcType == .eventClassifier {startTimerForShowScrollIndicator()}
    }
    
    override func viewWillDisappear(_ animated: Bool) { //print("...\(vcType) will disappear...")
        if vcType == .todoList {
            if textFieldDisplayed {
                eventField.removeFromSuperview()        //; print("removed text field")
                textFieldDisplayed = false
            }
        }
    }
}


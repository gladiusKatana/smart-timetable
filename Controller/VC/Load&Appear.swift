//  Load&Appear.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        setTopViewController()
        print("\n💾\(collectionViewType)-view loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionViewType == .days {
            setupViewTitle("\(monthString) \(year)", numLines: 1, alignment: .left)
        }
        else {
            currentDate = Date()
            processCurrentDate()
            
            if collectionViewType == .months {
                setupViewTitle("\(year)", numLines: 1, alignment: .left)
            }
            else {
                setupViewTitle("21st Century", numLines: 1, alignment: .left)
            }
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
        
        if collectionViewType == .days {
            removeMonthControlButtons()
            setupMonthControlButtons()
        }
    }
}

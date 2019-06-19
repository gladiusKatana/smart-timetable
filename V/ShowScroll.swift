//  ShowScroll.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension CollectionVC {
    
    @objc func showScrollIndicatorsInContacts() {
        UIView.animate(withDuration: 0.01) {
            self.collectionView?.flashScrollIndicators()
        }
    }
    
    func startTimerForShowScrollIndicator() {
        timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showScrollIndicatorsInContacts), userInfo: nil, repeats: true)
    }

}


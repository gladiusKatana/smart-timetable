//  ShowScrollBars.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension PopupMenuVC {
    
    func keepScrollIndicatorsVisible() {
        timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showScrollIndicatorsInContacts), userInfo: nil, repeats: true)
    }
    
    @objc func showScrollIndicatorsInContacts() {
        UIView.animate(withDuration: 0.01) {
            self.collectionView?.flashScrollIndicators()
        }
    }
    
}


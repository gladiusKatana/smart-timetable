//  ExtraPresent&Reload.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {
    
    @objc func reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: CollectionVC) {
        if previousOrientation == "landscape" && currentOrientation == "portrait"
            || willPresentVCAgainBecauseAppJustEnteredForeground {
            
            rePresentedVCFromButton = false              //; print("\n----------------------presented then reloaded \(vc.collectionViewType) cv ")
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation // * should probably factor out
                reloadWithDelay(after: 0.02)
            }
            
        } else {
            previousOrientation = currentOrientation     // * should probably factor out
            reloadCV() //reloadWithDelay(after: 0.02) // ?use time delay, as in above completion block? (will test over time, with different devices)
        }
    }
    
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {               //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    
    func setupAndPresent(vc: CollectionVC) {
        setupViewTitle("", numLines: 1, alignment: .left)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dismissNavController {
                let newVC = UINavigationController(rootViewController: vc)
                navController?.present(newVC, animated: false, completion: nil)
            }
        }
    }
    
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
    
    
    func rePresentTextField() {                     //print("rePresent")
        if textFieldDisplayed {
            eventField.removeFromSuperview()        //; print("removed")
            
            let customLayout = downcastLayout!
            
            formatAndPresentTextField(customLayout: customLayout)
        }
    }
    
    func formatAndPresentTextField(customLayout: CCVFlowLayout) {
        
        let fieldWidth = CGFloat(300)
        let fieldHeight = CGFloat(2 * customLayout.cellHeight!)
        let halfWidth = (customLayout.cellWidth! + globalKeyWindow.frame.width - fieldWidth) / 2
        
        eventField.text = eventField.placeholder
        eventField.delegate = self
        eventField.frame = CGRect(x: halfWidth, y: textFieldY, width: fieldWidth, height: fieldHeight)
        
        view.addSubview(eventField)
    }
}

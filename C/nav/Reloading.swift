//  Reloading.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

extension UICollectionViewController { //CollectionVC {
    
    @objc func reloadCV() {             //print("↺")
        self.collectionView.reloadData()
    }
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
    
    //---------reload again (and potentially re-present) for visual continuity, especially when toggling views while in landscape
    @objc func reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: CollectionVC) {
        
        classifierVC.view.removeFromSuperview() //; removedPopup = true
        
        if previousOrientation == "landscape" && currentOrientation == "portrait"
            || firstReenteredForeground
        {                                                //print("r*")
            rePresentedVCFromButton = false              //; print("\n----------------------presented then reloaded \(vc.collectionViewType) cv ")

            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation // * should probably factor out
                reloadWithDelay(after: 0.02)
            }
        } else {
            previousOrientation = currentOrientation     // * should probably factor out
            reloadCV() //reloadWithDelay(after: 0.02) // ?use time delay, as in above completion block? (will test over time, with different devices)
//            setupTitleAndPresentViewController(vc: vc) { () -> () in
//                previousOrientation = currentOrientation // * should probably factor out
//                reloadWithDelay(after: 0)
//            }
        }
    }
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {               //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {//setupAndPresent(vc: CollectionVC) {
        setupViewTitle("", numLines: 1, alignment: .left) // header titles is changed promptly from "" anyway
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
}


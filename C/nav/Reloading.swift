//  Reloading.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension UICollectionViewController {  
    
    @objc func reloadCV() {self.collectionView.reloadData() /*; print("↺")*/}
    
    func reloadWithDelay(after timeDelay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
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
        navController?.dismiss(animated: false, completion: nil); completion()
    }
    
    @objc func reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: CollectionVC) { //---------reload again (and potentially re-present) for...
        classifierVC.view.removeFromSuperview()                     // ...visual continuity (needed when, e.g., toggling views while in landscape)
        
        if previousOrientation == "landscape" && currentOrientation == "portrait" || firstReenteredForeground {
            rePresentedVCFromButton = false                         //; print("\n---------presented then reloaded \(vc.collectionViewType) cv ")
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation //* should probably factor out
                reloadWithDelay(after: 0.02)
            }
        } else {
            previousOrientation = currentOrientation
            reloadCV() //reloadWithDelay(after: 0.02) // ?use time delay, as in above completion block? (will test over time, with different devices)
            /*setupTitleAndPresentViewController(vc: vc) { () -> () in
             previousOrientation = currentOrientation
             reloadWithDelay(after: 0)
             }*/
        }
    }
}


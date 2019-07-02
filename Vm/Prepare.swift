//  Prepare.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CustomFlowLayout {
    
    override func prepare() {
        calculateSizes();   cellWidth = cellWd;     cellHeight = cellHt
        widthPlusSpace = cellWidth! + hSpace
        heightPlusSpace = cellHeight! + vSpace
        
        var statusBarDelta = 0.0
        if UIApplication.shared.statusBarFrame.size.height > 20 {
            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
        }
        yOffset = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta)    //print("yo: \(yOffSet)")
        xOffSet = collectionView!.contentOffset.x
        textFieldY = CGFloat(navBarHeight + statusBarHeight - statusBarDelta)               //; print("textFieldY = \(textFieldY)")
        
        checkOrientation() //; print("---------------------prepare \(topVC.vcType)-cv")
        //print("---------------------prepare \(currentTopVC.collectionViewType)-cv    \n                     cell width: \(cellWidth!)\n                     nav bar height: \(navBarHeight)")
        
        if previousOrientation != currentOrientation {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                topVC.reloadAfterVCIsPossiblyPresentedAgainFromCallToPrepare(vc: topVC)
            }
        } else {
            if topVC.vcType == .hours {
                processCurrentDate()                                                        //; print("process date from prepare")
            }
        }
        if topVC.vcType == .hours {
            topVC.rePresentTextField()
        }
    }
    
    func calculateSizes() {                                                                 //print("resizing cells")
        statusBarHeight = Double(UIApplication.shared.statusBarFrame.size.height)           //; print("status bar: \(statusBarHeight)")
        navBarHeight = Double((navController?.navigationBar.frame.height)!)                 //; print("nav bar: \(navBarHeight)")
        
        var frame: CGRect
        if embeddedInNavController {frame = globalKeyWindow.frame}
        //else {frame = customFrame!}   //* frame-setting inside this else{} may not be done in-time for popup views (ie non-nav-controller-embedded
        else {                           // view controllers).  In this app, presentPopupViewToMarkEvents() initializes the popup's frame anyway;...
            if let safeFrame = customFrame {//...this may work fine for the next version of collection-view-template, also... will investigate
                frame = safeFrame
            } else {frame = nilCatcherFrame} //...default frame is overridden anyway (see above comment); hence its value being all 0's
        }
        
        let autofitWidth = CGFloat(Double(frame.width) - 0.5) / CGFloat(cols) - hSpace
        let autoFitHeight = CGFloat(Double(frame.height) - navBarHeight - statusBarHeight) / CGFloat(rows) - vSpace
        
        switch cellDimensionsMode {
            
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;    cellHt = cellHeight!
            
        case .widthHardcoded:           cellWd = cellWidth!;    cellHt = autoFitHeight * autoFitHScale!
            
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight!
            
        case .neitherHardcoded:         cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHScale!
        }
        resetDimensionIfSquareCellsEnabled()
    }
}


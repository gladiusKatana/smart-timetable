//  NavBar.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

extension CollectionVC {  
    
    func setupViewTitle(_ titleText: String, numLines: Int, alignment: NSTextAlignment) {
        navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) //1366 is width (# of points) of the ipad pro 12.9"
        navbarTitleLabel.backgroundColor = .clear
        navbarTitleLabel.text = titleText; navbarTitleLabel.numberOfLines = numLines
        navbarTitleLabel.textAlignment = alignment
        navbarTitleLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        navbarTitleLabel.textColor = .black
        navbarTitleLabel.isUserInteractionEnabled = false
        navigationItem.titleView = navbarTitleLabel
    }
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        let navSelectorForDaysVC = #selector(buttonWrapperMethodforDaysVC)
        let navSelectorForMonthsVC = #selector(buttonWrapperMethodforMonthsVC)
        let navSelectorForYearsVC = #selector(buttonWrapperMethodforYearsVC)
        let navSelectorForReloading = #selector(reloadCV)
        
        let daysButton = setupButton(selector: navSelectorForDaysVC, title: "timetableImage")
        let monthsButton = setupButton(selector: navSelectorForMonthsVC, title: "calendarImage")
        let yearsButton = setupButton(selector: navSelectorForYearsVC, title: "reloadButton")
        let reloadButton = setupButton(selector: navSelectorForReloading, title: "reloadButton")
        navigationItem.rightBarButtonItems = [yearsButton, monthsButton, daysButton, reloadButton]
        
        var barButtonColours = [graySeven, graySeven, graySeven, .clear]
        
        for button in navigationItem.rightBarButtonItems! {
            if let index = navigationItem.rightBarButtonItems?.firstIndex(of: button) {
                button.tintColor = barButtonColours[index]
            }
        }
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } else {print("<no custom colour index>")}
        } else {print("<no custom colour>")}
    }
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    @objc func buttonWrapperMethodforDaysVC() {presentViaVCButton(vc: timetableVC)}
    @objc func buttonWrapperMethodforMonthsVC() {presentViaVCButton(vc: monthsVC)}
    @objc func buttonWrapperMethodforYearsVC() {presentViaVCButton(vc: yearsVC)}
    
    func presentViaVCButton(vc: CollectionVC) {
        rePresentedVCFromButton = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: vc)
        }
    }
}




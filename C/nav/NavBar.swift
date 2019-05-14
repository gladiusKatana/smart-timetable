//  NavBar.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CollectionVC {
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        let timetableButton = setupButton(selector: #selector(buttonWrapperMethodforTimetableVC), title: "timetableImage")
        let todoListButton = setupButton(selector: #selector(buttonWrapperMethodforTodoListVC), title: "calendarImage")
        let reloadButton = setupButton(selector: #selector(reloadCV), title: "reloadButton")
        
        navigationItem.rightBarButtonItems = [todoListButton, timetableButton, reloadButton]
        
        var barButtonColours = [graySeven, graySeven, .clear]
        
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
    
    @objc func buttonWrapperMethodforTimetableVC() {presentViaVCButton(vc: timetableVC)}
    @objc func buttonWrapperMethodforTodoListVC() {presentViaVCButton(vc: todoListVC)}
    
    func presentViaVCButton(vc: CollectionVC) {
        rePresentedVCFromButton = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: vc)
        }
    }
    
    func setupViewTitle(_ titleText: String, numLines: Int, alignment: NSTextAlignment) {
        navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) //1366 is width (# of points) of the ipad pro 12.9"
        navbarTitleLabel.backgroundColor = .clear
        navbarTitleLabel.text = titleText; navbarTitleLabel.numberOfLines = numLines
        navbarTitleLabel.textAlignment = alignment
        navbarTitleLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        navbarTitleLabel.textColor = .black
        navbarTitleLabel.isUserInteractionEnabled = false
        navigationItem.titleView = navbarTitleLabel
    }
}



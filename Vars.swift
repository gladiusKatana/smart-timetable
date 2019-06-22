//  Vars.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow!

var navController: UINavigationController? = UINavigationController()

var cellGap = CGFloat(0) // if nonzero, do not make this smaller than: 0.5 (iphone7), or else lines drawn inconsistently

//--------------------------------------------------------------------------------------------
var timetableLayout = CustomFlowLayout(rows: 25, cols: 8, lockedHeaderRows: 1, lockedHeaderSections: 1,
                                    customFrame: globalKeyWindow.frame,
                                    cellWidth: nil, cellHeight: nil, //* nil value for either dimension results in auto-fitting to screen width/height
                                autoFitWScale: nil, autoFitHScale: nil,     //* if an auto-fit scale factor is nil, default of 1.0 is used
                                hSpace: cellGap, vSpace: cellGap,           //* also, auto-fit scale factors ignored if width/height are not nil
                                loadsHorizontally: false, //❗️if loadsHorizontally is true, 'rows' look like columns. Just keep this in mind
                                squareCellMode: .noAutoSquare)

var todoListLayout = CustomFlowLayout(rows: 1, cols: 2, lockedHeaderRows: 0, lockedHeaderSections: 0,
                                 customFrame: globalKeyWindow.frame,
                                 cellWidth: nil, cellHeight: nil,
                                 autoFitWScale: 1, autoFitHScale: 1,
                                 hSpace: cellGap, vSpace: cellGap,
                                 loadsHorizontally: false,
                                 squareCellMode: .noAutoSquare)

var eventMarkerLayout = CustomFlowLayout(rows: 7, cols: 1, lockedHeaderRows: 1, lockedHeaderSections: 1,
                                 customFrame: globalKeyWindow.frame,
                                 cellWidth: timetableLayout.cellWidth! * 2, cellHeight: timetableLayout.cellHeight!,
                                 autoFitWScale: nil, autoFitHScale: nil,
                                 hSpace: cellGap, vSpace: cellGap,
                                 loadsHorizontally: false,
                                 squareCellMode: .noAutoSquare)

let popupFrame = CGRect(x: timetableLayout.cellWidth! * 2, y: 300,
                        width: timetableLayout.cellWidth! * 4, height: timetableLayout.cellHeight! * 2)

var classifierLayout = CustomFlowLayout(rows: 4, cols: 4, lockedHeaderRows: 0, lockedHeaderSections: 0,
                                       customFrame: popupFrame,
                                       cellWidth: timetableLayout.cellWidth!, cellHeight: timetableLayout.cellHeight!,
                                       autoFitWScale: nil, autoFitHScale: nil,
                                       hSpace: cellGap, vSpace: cellGap,
                                       loadsHorizontally: false,
                                       squareCellMode: .noAutoSquare)

var classifierVC = PopupMenuVC(.eventClassifier, collectionViewLayout: classifierLayout)



var timetableVC = CollectionVC(.hours, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: 1, collectionViewLayout: timetableLayout)
var todoListVC = CollectionVC(.todoList, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 0, collectionViewLayout: todoListLayout)
//for todoListVC: probably will obviate loopWeeks & demarcateWeeksByColour, via subclassing / making it an optional parameter
var eventMarkerVC = CollectionVC(.eventClassifier, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 1, collectionViewLayout: eventMarkerLayout)
var topVC = CollectionVC(.initial, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 0, collectionViewLayout: timetableLayout)
//--------------------------------------------------------------------------------------------

var statusBarHeight = 0.0;              var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;                 var launchWidth = 0.0

var xOffSet = CGFloat(0);               var yOffset = CGFloat(0)
var textFieldY = CGFloat(0)

var rePresentedVCFromButton = true;     var firstReenteredForeground = false

var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"
var launchOrientation = "orientation at the moment of launch"
var modelName = "device you're running on"

var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]
// left the above var global only to make it more prominent


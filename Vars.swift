//  Vars.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow!

var navController: UINavigationController? = UINavigationController()

var cellGap = CGFloat(0) // if nonzero, do not make this smaller than: 0.5 (iphone7), or else lines drawn inconsistently

//--------------------------------------------------------------------------------------------
var timetableLayout = CustomFlowLayout(embeddedInNavController: true,    // if true, it's fullscreen (with nav bar button); else it's a custom window
                                       customFrame: nil,                 // if nil, defaults to a pre-set frame (e.g. global key window frame)
                                       rows: 25, cols: 8, lockedHeaderRows: 1, lockedHeaderSections: 1,
                                       cellWidth: nil, cellHeight: nil,  //! if either dimension entered nil, screen width &/or height is autofitted
                                       autoFitWScale: 0.995, autoFitHScale: nil, //! if either of these parameters are nil, they default to 1.0
                                       hSpace: cellGap, vSpace: cellGap, //! auto-fit scaling factors above are ignored if width/height are not nil
                                       loadsHorizontally: false,         //❗️if loadsHorizontally is true, 'rows' look like columns
                                       squareCellMode: .noAutoSquare)

var todoListLayout = CustomFlowLayout(embeddedInNavController: true,
                                      customFrame: globalKeyWindow.frame,
                                      rows: 1, cols: 2, lockedHeaderRows: 0, lockedHeaderSections: 0,
                                      cellWidth: nil, cellHeight: nil,
                                      autoFitWScale: 1, autoFitHScale: 1,
                                      hSpace: cellGap, vSpace: cellGap,
                                      loadsHorizontally: false,
                                      squareCellMode: .noAutoSquare)

let popupFrame = CGRect(x: timetableLayout.cellWidth! * 2, y: 0,
                        width: timetableLayout.cellWidth!, height: timetableLayout.cellHeight! * 5)

var classifierLayout = CustomFlowLayout(embeddedInNavController: false,
                                        customFrame: nil,
                                        rows: 7, cols: 1, lockedHeaderRows: 1, lockedHeaderSections: 0,
                                        cellWidth: 80, cellHeight: 20,
                                        autoFitWScale: nil, autoFitHScale: nil,
                                        hSpace: cellGap, vSpace: cellGap,
                                        loadsHorizontally: false,
                                        squareCellMode: .noAutoSquare)

let nilCatcherFrame = CGRect(x: 0, y: 0, width: 0, height: 0)

var timetableVC = CollectionVC(.hours, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: 1, collectionViewLayout: timetableLayout)
var todoListVC = CollectionVC(.todoList, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 0, collectionViewLayout: todoListLayout)
//for todoListVC: may remove loopWeeks & demarcateWeeksByColour, via subclassing / making it an optional parameter
var classifierVC = PopupMenuVC(collectionViewLayout: classifierLayout)
var topVC = CollectionVC(.initial, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 0, collectionViewLayout: timetableLayout)
//--------------------------------------------------------------------------------------------

var statusBarHeight = 0.0;              var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;                 var launchWidth = 0.0

var xOffSet = CGFloat(0);               var yOffset = CGFloat(0);           var textFieldY = CGFloat(0)

var rePresentedVCFromButton = true;     var firstReenteredForeground = false

var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"
var launchOrientation = "orientation at the moment of launch"
var modelName = "device you're running on"

var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]
// left the above var global only to make it more prominent

var legendOne = "💾 = view loaded";     var legendTwo = "  🏞 = view appeared"  //console legend


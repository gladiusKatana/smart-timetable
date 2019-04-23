//  Layout.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

class CCVFlowLayout : UICollectionViewFlowLayout {  // stands for "Custom Collection View Flow Layout"
    var cellWidth: CGFloat?;        var cellHeight: CGFloat?;       var autoFitWScale: CGFloat?;        var autoFitHScale: CGFloat?
    var hSpace = CGFloat(0);        var vSpace = CGFloat(0);        var cellWd = CGFloat(0);            var cellHt = CGFloat(0)
    var xDefault = CGFloat(0);      var yDefault = CGFloat(0);      var widthPlusSpace = CGFloat(0);    var heightPlusSpace = CGFloat(0)
    var cols = 0;                   var rows = 0;                   var lockedHeaderRows = 0;           var lockedHeaderSections = 0
    var contentSize = CGSize.zero
    var cellDimensionsMode = CellDimensionsMode.neitherHardcoded;   var loadsHorizontally = false
    var squareCellMode = SquareCellMode.noAutoSquare;               var squareCells = false
    
    init(rows: Int, cols: Int, lockedHeaderRows: Int, lockedHeaderSections: Int,
         cellWidth: CGFloat?, cellHeight: CGFloat?,
         autoFitWScale: CGFloat?, autoFitHScale: CGFloat?,
         hSpace: CGFloat, vSpace: CGFloat, loadsHorizontally: Bool, squareCellMode: SquareCellMode) {
        
        if !loadsHorizontally {
            self.rows = rows;                       self.cols = cols
        }
        else {
            self.rows = cols;                       self.cols = rows
        }
        
        self.lockedHeaderRows = lockedHeaderRows;   self.lockedHeaderSections = lockedHeaderSections
        self.cellWidth = cellWidth;                 self.cellHeight = cellHeight
        
        self.autoFitHScale = (autoFitHScale != nil) ? autoFitHScale : 1
        self.autoFitWScale = (autoFitWScale != nil) ? autoFitWScale : 1
        
        self.hSpace = hSpace;                       self.vSpace = vSpace
        self.loadsHorizontally = loadsHorizontally; self.squareCellMode = squareCellMode
        super.init()
        
        if cellWidth != nil && cellHeight != nil        {cellDimensionsMode = .widthAndHeightHardcoded}
            
        else if cellWidth == nil && cellHeight != nil   {cellDimensionsMode = .heightHardcoded}
            
        else if cellWidth != nil && cellHeight == nil   {cellDimensionsMode = .widthHardcoded}
            
        else                                            {cellDimensionsMode = .neitherHardcoded}
        
        //print(cellDimensionsMode.simpleDescription()) //; print(squareCellMode.simpleDescription())
        
        calculateSizes()
        self.cellWidth = cellWd;   self.cellHeight = cellHt
        //drawTestSquare()         //print("status  \(statusBarHeight) / \(lastStatusBarHeight)  launch width  \(launchWidth)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

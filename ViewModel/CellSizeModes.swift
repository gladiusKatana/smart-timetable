//  CellSizeModes.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CCVFlowLayout { // although it may be useful to call some of these from a view controller... if so, will change to global definition(s)
    
    func resetDimensionIfSquareCellsOn() {
        switch squareCellMode {
        case .autoSquareWidthFromHeight:
            cellWd = cellHt
            
        case .autoSquareHeightFromWidth:
            cellHt = cellWd
            
        case .noAutoSquare:
            break
        }
    }
    
    enum SquareCellMode: Int {
        case noAutoSquare = 0
        case autoSquareHeightFromWidth, autoSquareWidthFromHeight
        func simpleDescription() -> String {
            switch self {
            case .noAutoSquare:
                return "cells are not auto-resized to be square"
            case .autoSquareHeightFromWidth:
                return "cell height is auto-resized to equal cell width"
            case .autoSquareWidthFromHeight:
                return "cell width is auto-resized to equal cell height"
            }
        }
    }
    
    enum CellDimensionsMode: Int {
        case widthAndHeightHardcoded = 0
        case widthHardcoded, heightHardcoded, neitherHardcoded
        func simpleDescription() -> String {
            switch self {
            case .widthAndHeightHardcoded:
                return "width and height of the cells are both hardcoded"
            case .widthHardcoded:
                return "width of the cells is hardcoded, height is auto-fitted"
            case .heightHardcoded:
                return "height of the cells is hardcoded, width is auto-fitted"
            case .neitherHardcoded:
                return "width and height of the cells are both auto-fitted"
            }
        }
    }
}

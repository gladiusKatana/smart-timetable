//  CellSizeModes.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

extension CustomFlowLayout {
    
    func resetDimensionIfSquareCellsEnabled() {
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


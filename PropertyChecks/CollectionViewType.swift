//  CollectionViewType.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

enum CollectionViewType: Int {
    case days = 0
    case months, years
    func simpleDescription() -> String {
        switch self {
        case .days:
            return "shows the days of this month"
        case .months:
            return "shows the months of this year"
        case .years:
            return "shows the years of this century"
        }
    }
}

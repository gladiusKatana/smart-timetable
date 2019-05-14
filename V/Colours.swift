//  Colours.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

let num = CGFloat(42)
var headerColour = UIColor.rgb(num, g: num, b: num, a: 1)  
var cellDefaultColour = navyBlue


var niceOrange = UIColor.rgb(228, g: 50, b: 44, a: 1)

var grayTwo = UIColor.rgb(0, g: 0, b: 0, a: 0.2)
var graySeven = UIColor.rgb(0, g: 0, b: 0, a: 0.7)

var icyBlue = UIColor.rgb(150, g: 180, b: 220, a: 1)
var halfIcyBlue = UIColor.rgb(150, g: 180, b: 220, a: 0.5)
var navyBlue = UIColor.rgb(0, g: 36, b: 82, a: 1)

var platinum = UIColor.rgb(214, g: 214, b: 214, a: 1)
var platinumLite = UIColor.rgb(214, g: 214, b: 255, a: 0.25)


var skyBackgroundImage = UIImage(named: "skyB")?.withRenderingMode(.alwaysOriginal)
var skyBackgroundColour = UIColor(patternImage: skyBackgroundImage!)                 //may use


var randomColours = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]                                   // used in TestSquare.swift



extension UIColor {
    static func rgb(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}


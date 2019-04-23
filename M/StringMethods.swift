//  StringMethods.swift
//  Extension created by Stack Overflow User NAlexN (see answer: Nov 6 '14 by NAlexN):  https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import Foundation

extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func substringWithAppends(input: String, preceding: String, following: String) -> String { // Garth Snyder added this method
    let str = "\(preceding)\(input.substring(fromIndex: 16))\(following)" // why 16 characters?  To start past the space in, eg, "Collection View 1"
    return str
}



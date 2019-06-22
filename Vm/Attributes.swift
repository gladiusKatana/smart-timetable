//  Attributes.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit
extension CustomFlowLayout { 
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {return true}
    
    override func invalidateLayout() {                                                                          //print("invalidated layout")
        super.invalidateLayout()
    }
    
    override var collectionViewContentSize: CGSize {                                                            //print("size = \(contentSize)")
        let w = CGFloat(cols) * widthPlusSpace
        let h = CGFloat(rows) * heightPlusSpace
        return CGSize(width: w, height: h)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {         //print("layout for elements...")
        var attributesForElements = [UICollectionViewLayoutAttributes]()
        
        for j in 0 ..< cols {
            for i in 0 ..< rows {
                
                var ip : IndexPath = IndexPath()
                
                if !loadsHorizontally {ip = IndexPath(item: i, section: j)}
                else                {ip = IndexPath(item: j, section: i)}
                
                let attribute = UICollectionViewLayoutAttributes(forCellWith: ip) //let attribute = self.layoutAttributesForItem(at: ip)!
                
                let xDefault : CGFloat = CGFloat(j) * widthPlusSpace
                let yDefault : CGFloat = CGFloat(i) * heightPlusSpace
                
                var xO = CGFloat(0);    var yO = CGFloat(0)                                                     //; print("*", terminator: "")
                
                if i < lockedHeaderRows && j < lockedHeaderSections {
                    xO = xOffSet + CGFloat(j) * widthPlusSpace

                    if self != eventMarkerLayout {
                        yO = yOffset + CGFloat(i) * heightPlusSpace
                    } else {yO = yOffset - CGFloat(navBarHeight + statusBarHeight)}
                }
                    
                else if i < lockedHeaderRows {
                    xO = xDefault
                    if self != eventMarkerLayout {
                        yO = yOffset + CGFloat(i) * heightPlusSpace
                    } else {yO = yOffset - CGFloat(navBarHeight + statusBarHeight)}
                }
                    
                else if j < lockedHeaderSections {
                    xO = xOffSet + CGFloat(j) * widthPlusSpace;     yO = yDefault
                }
                    
                else {
                    xO = xDefault;                                  yO = yDefault
                }
                
                attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight!)
                determineZIndex(item: j, section: i, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        return attributesForElements
    }
}


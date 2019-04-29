//  CollectionVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

class CollectionVC: UICollectionViewController {
    
    var downcastLayout : CCVFlowLayout?;    var collectionViewType = CollectionViewType.days
    var colourIndex: Int = Int()
    
    init(_ collectionViewType: CollectionViewType, colourIndex: Int, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.collectionViewType = collectionViewType
        self.colourIndex = colourIndex
        self.downcastLayout = layout as? CCVFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        
        setCellColours(cell: cell, indexPath: indexPath, layout: customLayout)
        setCellDateAndText(cell: cell, indexPath: indexPath, layout: customLayout)
        
        //print(".", terminator: "")
        //cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)"
        
        return cell
    }
}

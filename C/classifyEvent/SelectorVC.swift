//  SelectorVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

class SelectorVC: UICollectionViewController {
    
    var downcastLayout : CCVFlowLayout?;    var vcType = CollectionViewType.days
    
    init(_ vcType: CollectionViewType, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.vcType = vcType
        self.downcastLayout = layout as? CCVFlowLayout
    }
    
    override func viewDidLoad() {
        collectionView.frame = downcastLayout!.customFrame
        collectionView.backgroundColor = .orange
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        collectionView?.isScrollEnabled = true
        setupNavBarButtons(nil, atIndex: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
//        let customLayout = downcastLayout!
        let row = indexPath.item; let column = indexPath.section
        
        if row % 2 != 0 && column % 2 == 0 {
            cell.backgroundColor = .blue
        }
        else {
            cell.backgroundColor = .darkGray
        }
        
//        print(indexPath)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
}


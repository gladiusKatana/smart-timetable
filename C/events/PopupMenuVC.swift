//  SelectorVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

class PopupMenuVC: UICollectionViewController {
    
    var downcastLayout : CustomFlowLayout?;    var vcType = CollectionViewType.days
    
    init(_ vcType: CollectionViewType, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.vcType = vcType
        self.downcastLayout = layout as? CustomFlowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.frame = downcastLayout!.customFrame  
        collectionView.backgroundColor = .orange //.clear //
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        collectionView?.isScrollEnabled = true
        setupNavBarButtons(nil, atIndex: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item //; let column = indexPath.section
        
        cell.titleLabel.text = "\(indexPath)"
        
        if row < customLayout.lockedHeaderRows {
            cell.backgroundColor = .darkGray
        }
        else {
            if row % 2 != 0 {
                cell.backgroundColor = .blue
            }
            else { cell.backgroundColor = .lightGray}
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


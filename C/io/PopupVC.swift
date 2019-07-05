//  PopupVC.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

class PopupMenuVC: UICollectionViewController {
    
    var downcastLayout : CustomFlowLayout? 
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.downcastLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()                     //; collectionView.frame = downcastLayout!.customFrame
        collectionView.backgroundColor = .clear //.orange // * to experiment with later: why should i see any orange (if it's orange), upon rotation?
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        collectionView?.isScrollEnabled = true
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: downcastLayout!.cellHeight!, left: 0, bottom: 0, right: 0)
        collectionView?.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item                 //; let column = indexPath.section
        
        if row < customLayout.lockedHeaderRows { //|| column < customLayout.lockedHeaderSections { // popup menu design here has no need for > col.s
            cell.backgroundColor = headerColour
            cell.titleLabel.text = "< Mark '\(globalEventIdentifier)':" //"✔︎ Mark Event:" //← ⇦ ◄⬅️
            cell.titleLabel.textColor = platinum
        } else {
            cell.backgroundColor = .lightGray
            cell.titleLabel.text = EventStatus.allCases[row - 1].caseName()
            cell.titleLabel.textColor = headerColour
        }

        //print(indexPath)
        return cell
    }
}


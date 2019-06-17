////  ClientListViewController.swift
////  Dekoju
////  Created by Garth Snyder on 2018-12-01.  //  Copyright © 2018 Garth Snyder. All rights reserved.
//import UIKit;   import ContactsUI
//
//var clientListOpen = false;     var globalCellHeight = CGFloat();   var globalCellWidth = CGFloat()
//
//class ClientListViewController: CollectionVC { //UICollectionViewController {
//    var timerForShowScrollIndicator: Timer?
//    var onTimetable: Bool = Bool()
//    
////    override init(_ vcType: CollectionViewType, loopWeeks: Bool, demarcateWeeksByColour: Bool,
////         colourIndex: Int, collectionViewLayout layout: UICollectionViewLayout) {
////        super.init(collectionViewLayout: layout)
////        self.vcType = vcType
////        self.loopWeeks = loopWeeks
////        self.demarcateWeeksByColour = demarcateWeeksByColour
////        self.colourIndex = colourIndex
////        self.downcastLayout = layout as? CCVFlowLayout
////    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int                                    {return 1}
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {return 6}
//    
//    override func viewDidLoad() {                                           print("\n📋L", terminator: "")//📒
//        super.viewDidLoad()
//        collectionView?.frame = CGRect(x: eventMarkerStartingX, y: eventMarkerStartingY + globalCellHeight * 2,
//                                       width: globalCellWidth, height: globalCellHeight * 7)
//        collectionView?.register(CustomCellLeftTextAligned.self, forCellWithReuseIdentifier: CustomCellLeftTextAligned.reuseIdentifier)
//        collectionView?.isPrefetchingEnabled = false
//        collectionView?.isScrollEnabled = true
//        collectionView?.showsVerticalScrollIndicator = true
//        collectionView?.indicatorStyle = UIScrollView.IndicatorStyle.white
//        collectionView?.backgroundColor = .red
//    }
//    override func viewDidAppear(_ animated: Bool) {                         print("📋A\n")
//        super.viewDidAppear(true)
//        clientListOpen = true
////        startTimerForShowScrollIndicator()
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView,
//                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellLeftTextAligned.reuseIdentifier, for: indexPath) as! CustomCellLeftTextAligned
//        
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = icyBlue
//        }
//        else {
//            cell.backgroundColor = .darkGray
//        }
//        
//        cell.titleLabel.textColor = clientTextBlue
//        cell.titleLabel.font = UIFont.systemFont(ofSize: 11, weight: .ultraLight); cell.titleLabel.textAlignment = .left
//        cell.titleLabel.text = "..."
//        return cell
//    }
//}

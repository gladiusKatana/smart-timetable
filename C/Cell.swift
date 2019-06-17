//  Cell.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

class CustomCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomCell"
    lazy var titleLabel = UILabel()
    //var event = SimpleEvent() // may add this as a property of a cell; or may simply keep it in a detached data structure (dictionary) as it is now
    
    var cellColour = UIColor.clear
    var cellDate = Date()
    var markedForItems = false
    var xyCoordinate = [-2, -2]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = cellDefaultColour
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight) //UIFont(name: "Helvetica Neue", size: 12)
        titleLabel.textColor = cellTextDefaultColour
        
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = "" // use if title label text is ever set to a non-blank string
        
        self.backgroundColor = .clear
        self.cellColour = .clear
    }
}

class CustomCellLeftTextAligned: CustomCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal,
                                         toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}


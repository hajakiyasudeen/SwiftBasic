//
//  CategoryHeaderView.swift
//  SwiftBasic
//
//  Created by wflogin on 01/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

let kHeaderCellIdentifier = "kHeaderCellIdentifier"

class CategoryHeaderView: UICollectionReusableView {
    
    var label : UILabel!
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
//        label = UILabel.init()
        
        label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.textColor = UIColor.paleBlueColor
        
        self.addSubview(label)
        
        
        // Used for Single Element Code
//        NSLayoutConstraint.activate([
//            
//            
//            NSLayoutConstraint(item: textLabel, attribute: .leading, relatedBy: .equal,
//                               toItem: self, attribute: .leadingMargin,
//                               multiplier: 1.0, constant: 0.0),
//            
//            NSLayoutConstraint(item: textLabel, attribute: .trailing, relatedBy: .equal,
//                               toItem: self, attribute: .trailingMargin,
//                               multiplier: 1.0, constant: 0.0),
//            ])
        
        var constraintsArray:[Any] = []
        
        constraintsArray.append(label.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        
        constraintsArray.append(label.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        
        constraintsArray.append(label.topAnchor.constraint(equalTo: self.topAnchor))
        
        constraintsArray.append(label.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        
        NSLayoutConstraint.activate(constraintsArray as! [NSLayoutConstraint])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

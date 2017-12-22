//
//  TagsCollectionViewCell.swift
//  SwiftBasic
//
//  Created by wflogin on 09/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

let kCollectionCellIdentifier = "kCollectionCellIdentifier"

class TagsCollectionViewCell: UICollectionViewCell {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.palePinkColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addViews()
    }
    
    func addViews(){
        
        backgroundColor = UIColor.black
        
        addSubview(nameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

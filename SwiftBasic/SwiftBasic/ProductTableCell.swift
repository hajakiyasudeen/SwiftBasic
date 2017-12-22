//
//  ProductTableCell.swift
//  SwiftBasic
//
//  Created by wflogin on 09/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var collectionViewHeightConstraints : NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: kCollectionCellIdentifier)
        
        collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderCellIdentifier)

    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension ProductTableCell {
        
        func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
            
            collectionView.delegate = dataSourceDelegate
            collectionView.dataSource = dataSourceDelegate
            collectionView.tag = row
            collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
            collectionView.reloadData()
        }
        
        var collectionViewOffset: CGFloat {
            set { collectionView.contentOffset.x = newValue }
            get { return collectionView.contentOffset.x }
        }
}


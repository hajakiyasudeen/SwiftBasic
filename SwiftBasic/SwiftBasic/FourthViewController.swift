//
//  FourthViewController.swift
//  SwiftBasic
//
//  Created by wflogin on 09/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView! //CustomTableView!

    var arrayValues : NSArray = NSArray()

    var headerFieldValueArray : NSArray = NSArray()

//   let arrayValues = generateRandomData()
    
    var arraySubValues : NSArray = NSArray()

    var storedOffsets = [Int: CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerFieldValueArray = ["Select Size","Select Color"]

        arrayValues = ["28","30","32","34","36","38","40",]

        arraySubValues = ["Red","Green","Blue","Purple","Orange","Violet","Pink","Beige","Navy"]

        setUpSubviews()
    }

    //MARK: setUpSubviews
    func setUpSubviews() {
        
        //tableView
        tableView = UITableView.init()
        
//        tableView = [[CustomTableView alloc] initWithFrame:CGRectZero style:style];
        
//        tableView = CustomTableView.init(frame: CGRect.zero, style: .grouped)
    
//        tableView.setupConstraintsWithMinHeightValue(minHeightValue: 0.5)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.isScrollEnabled = false
        
        tableView.backgroundColor = UIColor.paleBlueColor
        
        let nib = UINib(nibName: "ProductTableCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "ProductTableCell")
        
        tableView.rowHeight = 300
        
        self.view.addSubview(tableView)
        
        
        var constraintArray:[Any] = []
        
        //collectionView
        constraintArray.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintArray.append(tableView.topAnchor.constraint(equalTo: view.topAnchor))
        
        constraintArray.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(constraintArray as! [NSLayoutConstraint])
        
    }
    // MARK: TableView DataSource & Delegate

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath) as!ProductTableCell
        
//        cell.collectionView.reloadData()
//        let height = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
//        print("height",height)
//        cell.collectionViewHeightConstraints.constant = height

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? ProductTableCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0

    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? ProductTableCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset

    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FourthViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK: Collectionview DataSource & Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headerFieldValueArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return (arrayValues[collectionView.tag] as AnyObject).count
        
        if section == 0 {
            
            return arrayValues.count
        }
        else {
            return arraySubValues.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
//        cell.backgroundColor = arrayValues[collectionView.tag][indexPath.item]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionCellIdentifier, for: indexPath) as! TagsCollectionViewCell

        if indexPath.section == 0{
            cell.nameLabel.text = arrayValues[indexPath.row] as? String
        }
        else if indexPath.section == 1 {
            cell.nameLabel.text = arraySubValues[indexPath.row] as? String
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var inputArray : NSArray = NSArray()
        
        if indexPath.section == 0 {
            //
            inputArray =  arrayValues as NSArray //(arrayValues[indexPath.row] as AnyObject) as! NSArray
        }
        else {
            inputArray = arraySubValues// (arraySubValues[indexPath.row] as AnyObject) as! NSArray
            
        }
        
        let size: CGSize = (inputArray[indexPath.row] as AnyObject).size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14.0)])
//        print("Before Size",size)
        
        let sizeValue = CGSize(width: size.width + 40.0, height: 50)
        
//        print("After Size",sizeValue)
        
        return sizeValue// arrayValues.bounds.size.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 10 :5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: kHeaderCellIdentifier,
                                                                             for: indexPath) as! CategoryHeaderView
            
            headerView.label.text = headerFieldValueArray[indexPath.section] as? String
            
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 30)
    }
}

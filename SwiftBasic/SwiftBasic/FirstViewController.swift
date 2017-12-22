//
//  ViewController.swift
//  SwiftBasic
//
//  Created by wflogin on 27/10/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let kCellIdentifier = "kCellIdentifier"
    
    var button: UIButton!
    
    var button1: UIButton!
    
    var firstLabel : UILabel!
    
    //    var tableView : UITableView!
    
    var containerView : UIView!
    
    var arrayValues : NSArray = NSArray()
    
    var arraySubValues : NSArray = NSArray()

//    var headerFieldValueArray = [String : Any] ()
    
    var headerFieldValueArray : NSArray = NSArray()
    
    var containerViewHeightConstraint : NSLayoutConstraint = NSLayoutConstraint()
    
    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.paleBlueColor
                
        headerFieldValueArray = ["1","Two"]
        
        //["1","2","3"] //
        arrayValues = ["Tommy HilfigerTommy","T","T","Tommy Hilfiger","Tommy",]
        
        arraySubValues = ["ABC","Tommy","Hilfiger",]
        
        setUpSubviews()
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()

        self.perform(#selector(containerViewHeight), with: nil, afterDelay: 0.5)
    }
    
    func containerViewHeight()  {
        
//        var contentSize = self.collectionView.contentSize.height + 50)  as Float
        
        let contentSize: Float = Float(self.collectionView.contentSize.height)
        
//        if contentSize {
        
            containerViewHeightConstraint.constant = CGFloat(contentSize)
        
        self.view.layoutIfNeeded()
        
//        }
    }
    //MARK: setUpSubviews
    func setUpSubviews() {
        
        //tableView
        
        //        tableView = UITableView.init()
        //
        //        tableView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        tableView.backgroundColor = UIColor.red
        //
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        //
        //        self.view.addSubview(tableView)
        
        //        collectionView =  UICollectionView.init()
        
        let firstLabel1 = UILabel()
        
        firstLabel = firstLabel1.labelWithBasicSetUp(title: "LeftAlignedLayout", titleColor: UIColor.red, superView: self.view)
        
        
        containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor.purple
        
        self.view.addSubview(containerView)
        
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: kCellIdentifier)
    
        collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderCellIdentifier)
        
        collectionView.backgroundColor = UIColor.lightGreenColor
        
        containerView.addSubview(collectionView)
        
        
        button = UIButton.init(type: .custom)
        
        button.setTitle("Scan", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitleColor(UIColor.lightNavyColor, for: .normal)
        
        button.backgroundColor = UIColor.paleBlueColor
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        
        button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        setUpConstraints()
    }
    
    func buttonSelected() {
        
        let secondVC = SecondViewController()
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    // MARK: Collectionview DataSource & Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headerFieldValueArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return arrayValues.count
        }
        else {
            return arraySubValues.count //section == 0 ? 20 :80
        }
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier, for: indexPath) as! CustomCell
        
        if indexPath.section == 0{
            cell.nameLabel.text = arrayValues[indexPath.row] as? String
        }
        else if indexPath.section == 1 {
            cell.nameLabel.text = arraySubValues[indexPath.row] as? String
        }
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var inputArray : NSArray = NSArray()
        
        if indexPath.section == 0 {
//
            inputArray =  arrayValues //(arrayValues[indexPath.row] as AnyObject) as! NSArray
        }
        else {
            inputArray = arraySubValues// (arraySubValues[indexPath.row] as AnyObject) as! NSArray

        }
        
        let size: CGSize = (inputArray[indexPath.row] as AnyObject).size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14.0)])
        print("Before Size",size)
        
        let sizeValue = CGSize(width: size.width + 40.0, height: 50)
        
        print("After Size",sizeValue)

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
    
    // MARK: Layout Setup
    func setUpConstraints () {
        
        var constraintArray:[Any] = []
        
        constraintArray.append(firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        if #available(iOS 11, *) {
            
//            let guide = view.safeAreaLayoutGuide
            
//            constraintArray.append(firstLabel.topAnchor.constraint(equalTo: guide.topAnchor))
        }
        else {
            constraintArray.append(firstLabel.topAnchor.constraint(equalTo: view.topAnchor))
            
        }
        
        constraintArray.append(containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintArray.append(containerView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor))
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 100)
        
        constraintArray.append(containerViewHeightConstraint)
        
//collectionView
        constraintArray.append(collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor))
        
        constraintArray.append(collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor))
        
        constraintArray.append(collectionView.topAnchor.constraint(equalTo: containerView.topAnchor))
        
        constraintArray.append(collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor))

        //button
        constraintArray.append(button.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(button.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintArray.append(button.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20))
        
        NSLayoutConstraint.activate(constraintArray as! [NSLayoutConstraint])
    }
    
    class CustomCell: UICollectionViewCell {
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.palePinkColor
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame:CGRect) {
            
            super.init(frame:frame)
            
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
}


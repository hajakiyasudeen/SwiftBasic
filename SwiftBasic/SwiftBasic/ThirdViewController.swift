//
//  ThirdViewController.swift
//  SwiftBasic
//
//  Created by wflogin on 01/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var myLabel : UILabel!

    var secondLabel : UILabel!

    var contentBackgroundScrollView : UIScrollView!
    
    var contentView : UIView!

    var dummyView : UIView!

    var heightLayoutConstraints  : NSLayoutConstraint = NSLayoutConstraint()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

//        self.navigationController?.navigationBar.isHidden = false

//        setUpSubviews()
        
        contentBackgroundScrollView = UIScrollView()

//        contentBackgroundScrollView.isScrollEnabled = true
        
        contentBackgroundScrollView.backgroundColor = UIColor.paleBlueColor
        
        contentBackgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(contentBackgroundScrollView)
        
        
        contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView.backgroundColor = UIColor.paleGrayColor;
        
        self.contentBackgroundScrollView.addSubview(contentView)

        
        dummyView = UIView()
        
        dummyView.translatesAutoresizingMaskIntoConstraints = false;
        
        dummyView.backgroundColor = UIColor.palePinkColor;
        
        self.contentBackgroundScrollView.addSubview(dummyView)

        
        layoutSetup()
        
        buttonSetUp()

    }

    
    func loadNavigation () {
        let leftBarItems = UIBarButtonItem(title: "Previous",
                                           style: .plain,
                                           target: self,
                                           action: #selector(backAction(sender:)))
        
        self.navigationItem.leftBarButtonItem = leftBarItems
        self.navigationController?.navigationBar.barTintColor = UIColor.red
    }
    
    func backAction(sender: UIBarButtonItem) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }

    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let contentSize: Float = Float(self.contentBackgroundScrollView.contentSize.height)

        print("contentSize",contentSize)
        
//        self.perform(#selector(heightLayout), with: nil, afterDelay: 5)
    }

    
    func heightLayout () {
        
        let contentSize: Float = Float(self.contentBackgroundScrollView.contentSize.height)

        heightLayoutConstraints.constant = CGFloat(contentSize)
        
        self.view.layoutIfNeeded()

    }
    func buttonSetUp() {
        
        let textsArray: NSMutableArray = ["A","ShortButtonValueButtonButton","Button","Longer Button","Very Long Button","Short","More Button","Any Key","A","ShortButtonValueButtonButton","Button","Longer Button","Very Long Button","Short","More Button","A","ShortButtonValueButtonButton","Button","Longer Button","Very Long Button","Short","More Button",]
        var indexOfLeftmostButtonOnCurrentLine: Int32 = 0
        let buttonsArray: NSMutableArray = NSMutableArray()
        var runningWidth: CGFloat = 0.0
        let maxWidth: CGFloat = 300.0
        let horizontalSpaceBetweenButtons: CGFloat = 10.0
        let verticalSpaceBetweenButtons: CGFloat = 50.0
        for i in 0..<textsArray.count {
            let button: UIButton = UIButton(type: .roundedRect)
            
            //            button.setTitle(textsArray.object(at: i), for: .normal)
            button.setTitle(textsArray.object(at: i) as? String, for: .normal)
            button.sizeToFit()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.backgroundColor = UIColor.red
            
            self.contentView.addSubview(button)
            // check if first button or button would exceed maxWidth
            
            if ((i == 0) || (runningWidth + button.frame.size.width > maxWidth)) {
                
                runningWidth = CGFloat(button.frame.size.width)
                
                if i == 0 {
                    // first button (top left)
                    // horizontal position: same as previous leftmost button (on line above)
                    let horizontalConstraint: NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: CGFloat(horizontalSpaceBetweenButtons))
                    self.contentView.addConstraint(horizontalConstraint)
                    // vertical position:
                    let verticalConstraint: NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: CGFloat(verticalSpaceBetweenButtons))
                    self.contentView.addConstraint(verticalConstraint)
                } else {
                    // put it in new line
                    let previousLeftmostButton: UIButton = buttonsArray.object(at: Int(indexOfLeftmostButtonOnCurrentLine)) as! UIButton
                    // horizontal position: same as previous leftmost button (on line above)
                    let horizontalConstraint: NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: previousLeftmostButton, attribute: .left, multiplier: 1.0, constant: 0.0)
                    self.contentView.addConstraint(horizontalConstraint)
                    // vertical position:
                    let verticalConstraint: NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: previousLeftmostButton, attribute: .bottom, multiplier: 1.0, constant: CGFloat(verticalSpaceBetweenButtons))
                    self.contentView.addConstraint(verticalConstraint)
                    indexOfLeftmostButtonOnCurrentLine = Int32(i)
                    
                }
            } else {
                
                runningWidth += button.frame.size.width + horizontalSpaceBetweenButtons
                var previousButton: UIButton? = buttonsArray[i - 1] as? UIButton
                // horizontal position: right from previous button
                let horizontalConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: previousButton, attribute: .right, multiplier: 1.0, constant: CGFloat(horizontalSpaceBetweenButtons))
                self.contentView.addConstraint(horizontalConstraint)
                // vertical position same as previous button
                let verticalConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: previousButton, attribute: .top, multiplier: 1.0, constant: 0.0)
                self.contentView.addConstraint(verticalConstraint)
                
            }
            
            buttonsArray.add(button)
        }
    }
    
    
    func setUpSubviews()  {
        
        let firstLabel1 = UILabel()
        
        myLabel = firstLabel1.labelWithBasicSetUp(title: "Hello World", titleColor: UIColor.gray, superView: self.view)
        
        let label = UILabel()
        
        secondLabel = label.labelWithBasicSetUp(title: "Touch Me", titleColor: UIColor.palePinkColor, superView: self.view)
        
        var constraintArray : [Any] = []
        
        if#available(iOS 11, *) {
            
//            let guide = view.safeAreaLayoutGuide
//            
//            constraintArray.append(myLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0))
        }
        else {
            
            constraintArray.append(myLabel.topAnchor.constraint(equalTo: view.topAnchor))
        }
        constraintArray.append(myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//    constraintArray.append(secondLabel.topAnchor.constraintEqualToSystemSpacingBelow(myLabel.bottomAnchor, multiplier: 1))
        
        constraintArray.append(secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintArray.append(secondLabel.heightAnchor.constraint(equalToConstant: 150))
        
        
        NSLayoutConstraint.activate(constraintArray as! [NSLayoutConstraint])
        
        /*    if #available(iOS 11, *) {
         let guide = view.safeAreaLayoutGuide
         NSLayoutConstraint.activate([
         myLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
         guide.bottomAnchor.constraintEqualToSystemSpacingBelow(myLabel.bottomAnchor, multiplier: 1.0)
         ])
         
         } else {
         let standardSpacing: CGFloat = 8.0
         NSLayoutConstraint.activate([
         myLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
         bottomLayoutGuide.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: standardSpacing)
         ])*/
        
    }
    
    func layoutSetup() {
        
        var constraintArray : [Any] = []
        
        constraintArray.append(contentBackgroundScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant:100))
        
        constraintArray.append(contentBackgroundScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintArray.append(contentBackgroundScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        //        heightLayoutConstraints = contentBackgroundScrollView.heightAnchor.constraint(equalToConstant: 150)
        
        //        constraintArray.append(heightLayoutConstraints)
        
        constraintArray.append(contentBackgroundScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        constraintArray.append(contentView.leadingAnchor.constraint(equalTo: contentBackgroundScrollView.leadingAnchor))
        
        constraintArray.append(contentView.trailingAnchor.constraint(equalTo: contentBackgroundScrollView.trailingAnchor))
        
        //        constraintArray.append(contentView.widthAnchor.constraint(equalTo: contentBackgroundScrollView.widthAnchor, multiplier: 1))
        //
        //        constraintArray.append(contentView.heightAnchor.constraint(equalTo: contentBackgroundScrollView.heightAnchor, multiplier: 1))
        
        constraintArray.append(contentView.topAnchor.constraint(equalTo: contentBackgroundScrollView.topAnchor))
        
        //        constraintArray.append(contentView.bottomAnchor.constraint(equalTo: contentBackgroundScrollView.bottomAnchor))
        
        constraintArray.append(contentView.centerXAnchor.constraint(equalTo: contentBackgroundScrollView.centerXAnchor))
        
        constraintArray.append(contentView.heightAnchor.constraint(equalToConstant: 450))

        constraintArray.append(dummyView.topAnchor.constraint(equalTo: contentView.bottomAnchor))
        
        constraintArray.append(dummyView.leadingAnchor.constraint(equalTo: contentBackgroundScrollView.leadingAnchor))
        
        constraintArray.append(dummyView.trailingAnchor.constraint(equalTo: contentBackgroundScrollView.trailingAnchor))
        
        constraintArray.append(dummyView.heightAnchor.constraint(equalToConstant: 150))

        constraintArray.append(dummyView.bottomAnchor.constraint(equalTo: contentBackgroundScrollView.bottomAnchor))
        
        
        //        constraintArray.append(contentView.widthAnchor.constraint(equalToConstant: CGFloat)
        
        
        NSLayoutConstraint.activate(constraintArray as! [NSLayoutConstraint])


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

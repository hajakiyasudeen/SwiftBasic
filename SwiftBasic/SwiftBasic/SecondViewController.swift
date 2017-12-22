//
//  SecondViewController.swift
//  SwiftBasic
//
//  Created by wflogin on 31/10/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var myLabel : UILabel!
    
    var imageToAnimate : UIImageView!
    
    var cartButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown
        
        self.navigationController?.navigationBar.isHidden = false

        setUpSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        loadNavigation()
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
    func setUpSubviews()  {
        
        let firstLabel1 = UILabel()
        
        myLabel = firstLabel1.labelWithBasicSetUp(title: "Hello World", titleColor: UIColor.gray, superView: self.view)
        
        myLabel.backgroundColor = UIColor.paleGrayColor
        
        
        imageToAnimate = UIImageView.init(image: UIImage.init(named: "watch.jpg"))
        
        imageToAnimate.translatesAutoresizingMaskIntoConstraints = false
        
        imageToAnimate.backgroundColor = UIColor.palePinkColor
        
        self.view.addSubview(imageToAnimate)
        
        
        cartButton = UIButton.init(type: .custom)
        
        cartButton.setTitle("Add To Cart", for: .normal)
        
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        
        cartButton.setTitleColor(UIColor.lightNavyColor, for: .normal)
        
        cartButton.backgroundColor = UIColor.paleGrayColor
        
        cartButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        
        cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        
        self.view.addSubview(cartButton)

        
//        var myArray : NSMutableArray = ["Hello"]
//
        var constraintsArray:[Any] = []
        
//        let margins = view.layoutMarginsGuide
//
//        NSLayoutConstraint.activate([myLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//                                     myLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)])
//
//        if #available(iOS 11, *) {
//            let guide = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                myLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
//                guide.bottomAnchor.constraintEqualToSystemSpacingBelow(myLabel.bottomAnchor, multiplier: 1.0)
//                ])
//
//        } else {
//            let standardSpacing: CGFloat = 8.0
//            NSLayoutConstraint.activate([
//                myLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
//                bottomLayoutGuide.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: standardSpacing)
//                ])
//        }
        constraintsArray.append(myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintsArray.append(myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintsArray.append(myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant : 50))

        constraintsArray.append(myLabel.heightAnchor .constraint(equalToConstant: 50))
        
        
        constraintsArray.append(imageToAnimate.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintsArray.append(imageToAnimate.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintsArray.append(imageToAnimate.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant : 50))
        
        constraintsArray.append(imageToAnimate.heightAnchor .constraint(equalToConstant: 100))

        constraintsArray.append(imageToAnimate.widthAnchor .constraint(equalToConstant: 100))

        
        constraintsArray.append(cartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        
        constraintsArray.append(cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraintsArray.append(cartButton.heightAnchor .constraint(equalToConstant: 50))

        constraintsArray.append(cartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20))

        NSLayoutConstraint.activate(constraintsArray as! [NSLayoutConstraint])
        
        
    }

    func addToCart(sender:UIButton) {
        
        let thirdVC = FourthViewController()//ThirdViewController()
        
        self.navigationController?.pushViewController(thirdVC, animated: true)
        
//        addAnimateToCart()
}
    
    func addAnimateToCart () {
        
        let imageViewForAnimation = UIImageView(image: imageToAnimate.image)
        imageViewForAnimation.alpha = 1.0
        let imageFrame: CGRect = CGRect(x: imageViewForAnimation.frame.maxX, y: imageViewForAnimation.frame.maxY, width: 200, height: 100) // imageViewForAnimation.frame
        //Your image frame.origin from where the animation need to get start
        var viewOrigin: CGPoint = imageViewForAnimation.frame.origin
        viewOrigin.y = viewOrigin.y + imageFrame.size.height / 2.0
        viewOrigin.x = viewOrigin.x + imageFrame.size.width / 2.0
        imageViewForAnimation.frame = imageFrame
        imageViewForAnimation.layer.position = viewOrigin
        view.addSubview(imageViewForAnimation)
        // Set up fade out effect
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.toValue = 0.3
        fadeOutAnimation.fillMode = kCAFillModeForwards
        fadeOutAnimation.isRemovedOnCompletion = false
        
        
        let resizeAnimation = CABasicAnimation(keyPath: "bounds.size")
        resizeAnimation.toValue = NSValue(cgSize: CGSize(width: 40.0, height: imageFrame.size.height * (40.0 / imageFrame.size.width)))
        resizeAnimation.fillMode = kCAFillModeForwards
        resizeAnimation.isRemovedOnCompletion = false
        // Set up path movement
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.calculationMode = kCAAnimationPaced
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        //Setting Endpoint of the animation
        //CGPoint endPoint = CGPointMake(480.0f - 30.0f, 40.0f);
        var endPoint = CGPoint.zero
        let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        if UIInterfaceOrientationIsPortrait(orientation) {
            endPoint = CGPoint(x: 350.0, y: 1024.0)
        }
        else {
            endPoint = CGPoint(x: 475.0, y: 1024.0)
        }

        let curvedPath: CGMutablePath = CGMutablePath()
        curvedPath.move(to: CGPoint(x: viewOrigin.x, y: viewOrigin.y), transform: .identity)
        curvedPath.addCurve(to: CGPoint(x: endPoint.x, y: endPoint.y), control1: CGPoint(x: endPoint.x, y: viewOrigin.y), control2: CGPoint(x: endPoint.x, y: viewOrigin.y), transform: .identity)
        pathAnimation.path = curvedPath
        
        let group = CAAnimationGroup()
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false
        group.animations = [fadeOutAnimation, pathAnimation, resizeAnimation]
        group.duration = 0.7 as? CFTimeInterval ?? CFTimeInterval()
        group.delegate = self as? CAAnimationDelegate
        group.setValue(imageViewForAnimation, forKey: "imageViewBeingAnimated")
        imageViewForAnimation.layer.add(group, forKey: "savingAnimation")

    }
}

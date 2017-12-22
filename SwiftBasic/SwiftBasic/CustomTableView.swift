//
//  CustomTableView.swift
//  SwiftBasic
//
//  Created by wflogin on 10/11/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

    var selfMinHeight : Float!
    
    var updateLayoutView : UIView!

    var selfHeightConstraint : NSLayoutConstraint!
    
//    static float const MDTableViewDefaultMinHeight                  = 5.;

//    @property (nonatomic, strong) NSLayoutConstraint                                * selfHeightConstraint;
//    
//    - (void)setupConstraintsWithMinHeightValue:(float)minHeightValue;
//    
//    - (void)updateHeight;

    var MDTableViewDefaultMinHeight = 0.5

    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        selfMinHeight = 0

        addObserver()
    }
    
    func setupConstraintsWithMinHeightValue(minHeightValue : Float) {
        
        //        selfMinHeight = (minHeightValue >= MDTableViewDefaultMinHeight ? minHeightValue : MDTableViewDefaultMinHeight);
        
        selfMinHeight = minHeightValue > Float(MDTableViewDefaultMinHeight) ? minHeightValue:Float(MDTableViewDefaultMinHeight)
        
        
        
        selfHeightConstraint = self.heightAnchor.constraint(equalToConstant: CGFloat(selfMinHeight))
        
        selfHeightConstraint.isActive = true
        
    }
    
    func updateHeight() {
        
        var height = Float(self.contentSize.height)
        
        if (height != 0 && (selfHeightConstraint != nil)) && (selfHeightConstraint.constant !=
            CGFloat(height)) {
            
            
            if(height < selfMinHeight) {
                
                height = selfMinHeight
            }
            
            selfHeightConstraint.constant = CGFloat(height)
            
            if((updateLayoutView) != nil) {
                
                updateLayoutView .layoutIfNeeded()
            }
            else if ((self.superview) != nil) {
                
                self.superview?.layoutIfNeeded()
                
            }
        }
        
    }
    
    func addObserver (){
        
        //        self.addObserver(self, forKeyPath: NSStringFromSelector(#selector(contentSize)), options: , context: NULL)
        
        self.addObserver(self, forKeyPath: NSStringFromSelector(#selector(getter: contentSize)), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //        if let newValue = change?[NSKeyValueChangeKey] {
        updateHeight()
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: NSStringFromSelector(#selector(getter: contentSize)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

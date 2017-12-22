//
//  UILabel.swift
//  SwiftBasic
//
//  Created by wflogin on 31/10/17.
//  Copyright © 2017 wflogin. All rights reserved.
//

import UIKit

extension UILabel {
    
    func labelWithBasicSetUp(title:String, titleColor: UIColor, superView : UIView) -> UILabel {
        
        let label = UILabel.init()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = titleColor
        
        label.text = title
        
        label.font = UIFont.systemFont(ofSize: 15)
        
        label.backgroundColor = UIColor.clear
   
        superView.addSubview(label)
        
//        addSubview(label)
        
        return label
    }
    
}

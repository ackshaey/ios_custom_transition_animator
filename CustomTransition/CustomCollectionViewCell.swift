//
//  CustomCollectionViewCell.swift
//  CustomTransition
//
//  Created by Ackshaey Singh on 3/25/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.layer.cornerRadius = frame.size.width/2.0
        self.layer.backgroundColor = randomColor().CGColor
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random() % 255) / 255.0
        let green = CGFloat(arc4random() % 255) / 255.0
        let blue = CGFloat(arc4random() % 255) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

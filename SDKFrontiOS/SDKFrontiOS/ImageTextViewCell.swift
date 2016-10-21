//
//  ImageTextViewCell.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 19/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class ImageTextViewCell: UITableViewCell {

    var imageTextView : ImageTextView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.imageTextView = NSBundle.mainBundle().loadNibNamed("ImageTextView", owner: self, options: nil)?[0] as? ImageTextView;
        
        self.contentView.addSubview(self.imageTextView!);
        self.imageTextView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.imageTextView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.imageTextView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}

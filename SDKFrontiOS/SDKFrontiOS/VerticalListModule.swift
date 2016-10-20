//
//  VerticalListModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 18/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class VerticalListModule: Module {
    
    var verticalListView : VerticalListView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.verticalListView = NSBundle.mainBundle().loadNibNamed("VerticalListView", owner: self, options: nil)?[0] as? VerticalListView;
        
        self.contentView.addSubview(self.verticalListView!);
        self.verticalListView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.verticalListView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.verticalListView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}

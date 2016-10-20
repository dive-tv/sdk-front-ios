//
//  HorizontalListModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class HorizontalListModule: Module {
    
    var horizontalListView : HorizontalListView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.horizontalListView = NSBundle.mainBundle().loadNibNamed("HorizontalListView", owner: self, options: nil)?[0] as? HorizontalListView;
        
        self.contentView.addSubview(self.horizontalListView!);
        self.horizontalListView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.horizontalListView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.horizontalListView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
}

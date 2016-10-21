//
//  Header.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Header: Module {

    var headerView : HeaderView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)?[0] as? HeaderView;
        
        self.contentView.addSubview(self.headerView!);
        self.headerView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.headerView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.headerView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}

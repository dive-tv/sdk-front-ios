//
//  Carry.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 21/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Carry: Module {

    var carryView : CarryView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.carryView = NSBundle.mainBundle().loadNibNamed("CarryView", owner: self, options: nil)?[0] as? CarryView;
        
        self.contentView.addSubview(self.carryView!);
        self.carryView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.carryView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.carryView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }

}

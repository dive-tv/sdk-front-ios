//
//  SingleModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 18/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class SingleModule: Module {

    var singleModuleView : SingleModuleView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.singleModuleView = NSBundle.mainBundle().loadNibNamed("SingleModuleView", owner: self, options: nil)?[0] as? SingleModuleView;
        
        self.contentView.addSubview(self.singleModuleView!);
        self.singleModuleView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.singleModuleView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.singleModuleView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}

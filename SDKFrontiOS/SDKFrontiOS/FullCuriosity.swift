//
//  FullCuriosity.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class FullCuriosity: Module {
    
    var fullCuriosityView : FullCuriosityView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.fullCuriosityView = NSBundle.mainBundle().loadNibNamed("FullCuriosityView", owner: self, options: nil)?[0] as? FullCuriosityView;
        
        self.contentView.addSubview(self.fullCuriosityView!);
        self.fullCuriosityView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.fullCuriosityView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.fullCuriosityView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}

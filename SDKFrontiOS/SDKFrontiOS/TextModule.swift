//
//  TextModule.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 12/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TextModule : Module{
    
    var textView : TextView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.textView = NSBundle.mainBundle().loadNibNamed("TextView", owner: self, options: nil)?[0] as? TextView;
        
        self.contentView.addSubview(self.textView!);
        self.textView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.textView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.textView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    /*override class func validate(data: CardDetail) throws {
        print("VALIDATE: TEXTMODULE");
    }*/
}

//
//  VideoModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 20/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class VideoModule: Module {

    var videoView : VideoView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.videoView = NSBundle.mainBundle().loadNibNamed("VideoView", owner: self, options: nil)?[0] as? VideoView;
        
        self.contentView.addSubview(self.videoView!);
        self.videoView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.videoView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.videoView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }

}

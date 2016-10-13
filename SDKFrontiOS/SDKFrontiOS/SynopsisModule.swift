//
//  SynopsisModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class SynopsisModule: TextModule {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(data: CardData) throws -> Bool{
       
        try super.validate(data);
   
        print("VALIDATE: SYNOPSIS MODULE");
        return true;
    }
    
}

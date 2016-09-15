//
//  Target.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 15/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

public class Target: NSObject {
    
    private var sectionId : String?;
    private var text : String?;

    init(sectionId : String, text : String){
        super.init();
        self.sectionId = sectionId;
        self.text = text;
    }
    
}

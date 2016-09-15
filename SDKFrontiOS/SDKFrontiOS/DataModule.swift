//
//  DataModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 15/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

public class DataModule: NSObject {
    
    private var modType : ModuleType?;
    private var targets : [Target]?;
    
    
    init(modType : ModuleType, targets : [Target]? = nil){
        super.init();
        self.modType = modType;
        self.targets = targets;
    }

}

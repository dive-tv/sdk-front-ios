//
//  DataModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 15/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

public class ConfigModule: NSObject {
    
    private(set) var moduleName : String?;
    private(set) var targets : [Target]?;
    
    
    init(moduleName : String, targets : [Target]? = nil){
        super.init();
        
        self.moduleName = moduleName;
        self.targets = targets;
    }

}

//
//  ConfigSection.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation

public class ConfigSection : NSObject{
    
    private(set) var arrayModules = [ConfigModule]();
    var isValidSection : Bool = false;
    
    public override init() {
        super.init();
    }
    
    /**
     This method add a module type to array of Modules.
     
     - parameter moduleName: The module the user wants to add.
     - parameter targets: The targets with the id of the section and the name.
     */
    public func addModule(moduleName : String, targets : [Target]? = nil){
        let configModule = ConfigModule(moduleName: moduleName, targets: targets);
        self.arrayModules.append(configModule);
    }
    
}
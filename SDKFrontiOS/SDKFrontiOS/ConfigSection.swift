//
//  ConfigSection.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation

public class ConfigSection : NSObject{
    
    private var arrayModules = [DataModule]();
    
    public override init() {
        super.init();
    }
    
    /**
     This method add a module type to array of Modules.
     
     - parameter modType: The module type the user wants to add.
     - parameter targets: The targets with the id of the section and the name.
     */
    public func addModule(modType : ModuleType, targets : [Target]? = nil){
        let data = DataModule(modType: modType, targets: targets);
        self.arrayModules.append(data);
    }
    
    /**
     This method returns an array of modules of a section.
     
     - returns: The array of modules.
     */
    public func getModules()->[DataModule]{
        return self.arrayModules;
    }

}
//
//  ConfigSection.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation

public class ConfigSection : NSObject{
    
    private var arrayModules : [ModuleType]?;
    
    public override init() {
        super.init();
    }
    
    /**
     This method add a module type to array of Modules.
     
     - parameter modType: The module type the user wants to add.
     */
    public func addModule(modType : ModuleType){
        // TODO: need to do the logic
    }
    
    public func addNavigation(){
    }
    
    
    /**
     This method returns an array of modules of a section.
     
     - returns: The array of modules.
     */
    public func getModules()->[ModuleType]?{
        return self.arrayModules;
    }

}
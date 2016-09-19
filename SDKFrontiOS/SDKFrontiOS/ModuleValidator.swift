//
//  ModuleValidator.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ModuleValidator : NSObject{
    
    private var validatorData = [String : [String]]();
    
    init(customValidator : JSON? = nil){
        super.init();
        self.createDefaultValidators();
        if customValidator != nil{
            self.addCustomValidatorData(customValidator!);
        }
    }
    
    
    /**
     This method check if the data have all the information for a module.
     
     - parameter data:       The data with all the info
     - parameter moduleName: The name of the module to get the information the module needs
     
     - returns: Return true if the data have the information the module needs or false if not
     */
    func validate(data : CardData, moduleName : String)->Bool{
        if let attributes = self.validatorData[moduleName]{
            for attribute in attributes{
                // TODO: need to the logic
            }
        }
        
        return true;
    }
    
    
    // MARK: Private Methods
    /**
     This add default validators to the data.
     */
    private func createDefaultValidators(){
        self.validatorData["PhotoModule"] = ["image"];
        self.validatorData["TitleModule"] = ["title"];
    }
    
    /**
     This method add to the validator the custom modules and the information of the custom modules needs.
     
     - parameter data: A JSON with all the custom modules and the information of the custom modules needs
     */
    private func addCustomValidatorData(data : JSON){
        for (key, subJson) in data{
            // Only add to the validator data if don't exist
            if(self.validatorData[key] == nil){
                self.validatorData[key] = subJson.arrayValue.map{$0.string!};
            }
        }
    }
    
    
}
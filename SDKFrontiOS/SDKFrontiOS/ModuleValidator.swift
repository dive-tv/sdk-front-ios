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
    
    init(customValidator : JSON? = nil){
        super.init();
    }
    
    
    /**
     This method check if the data have all the information for a module.
     
     - parameter data:       The data with all the info
     - parameter moduleName: The name of the module to get the information the module needs
     
     - returns: Return true if the data have the information the module needs or false if not
     */
    func validate(data : CardData, moduleType : String)->Bool{
       
        //For Testing
        let cardData = CardData(_cardId: "ID", _title: "title", _type: TypeOfCard.Movie);
        
        let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String;
        let moduleClass = NSClassFromString(appName + "." + moduleType) as! Module.Type
        
        do{
            try moduleClass.validate(cardData);
            return true;
        }
        catch{
            print("An Error Ocurred");
            return false;
        }
    }
}

//
//  User.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class User : NSObject, Validatable{
    
    var isLiked : Bool;
    
    init(data: JSON){
        //validated variables
        self.isLiked = data["is_liked"].boolValue;
    }
    
    class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateUserErrors.emptyData);
            return;
        }
        
        if(_data["is_liked"].bool == nil){
            try DataModelErrors.ThrowError(DataModelErrors.CreateUserErrors.invalidData);
        }
    }
}

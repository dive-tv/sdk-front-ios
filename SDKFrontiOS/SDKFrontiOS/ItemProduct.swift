//
//  ProductItem.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class ItemProduct : Product{
    var matching : Bool;
    
    override init(data: JSON){
        self.matching = data["matching"].boolValue;
        super.init(data: data);
    }
    
    override class func validate(_ data: JSON?) throws{
        
        try super.validate(data);
        
        guard let _ = data!["matching"].bool else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateProductErrors.invalidData);
            return;
        }
    }
}

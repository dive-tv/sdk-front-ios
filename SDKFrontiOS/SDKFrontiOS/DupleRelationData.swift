//
//  DupleRelationData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 23/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class DupleRelationData : RelationData{
    
    var relType : String;
    var from : MiniCard;
    var to : MiniCard;
    
    init(data: JSON){
        //validated variables
        self.relType = data["rel_type"].object as! String;
        self.from = MiniCard(data: data["from"]);
        self.to = MiniCard(data: data["to"]);
    }
    
    override class func validate(_ data: JSON?) throws{
        guard let _data = data , _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsDataErrors.emptyData);
            return;
        }
        
        guard case let (_relType as String, _from as JSON, _to as JSON) = (_data["rel_type"].object, _data["from"], _data["to"])
            , _relType != ""else{
                //Throw indavilData Error
                try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsDataErrors.invalidData);
                return;
        }
        
        try MiniCard.validate(_from);
        try MiniCard.validate(_to);
    }
}

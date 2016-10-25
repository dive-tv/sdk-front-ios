//
//  SingleRelationData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 23/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class SingleRelationData : RelationData{
    
    var card : MiniCard;
    
    init(data: JSON){
        //validated variables
        self.card = MiniCard(data: data);
    }
    
     override class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsDataErrors.emptyData);
            return;
        }
    
        try MiniCard.validate(_data);
    }
}

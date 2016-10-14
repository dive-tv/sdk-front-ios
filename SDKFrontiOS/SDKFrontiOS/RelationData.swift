//
//  RelationData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class RelationData : NSObject {
    
    var relType : Int!;
    var cards : CardDetailData!;
    
    init(_relType : Int, _cards : CardDetailData!) {
        
        self.relType = _relType;
        self.cards = _cards;
    }
    
}

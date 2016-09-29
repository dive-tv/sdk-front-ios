//
//  CarouselCard.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

public class CarouselCard : NSObject {
    
    var data : CardData!;
    var relations : [RelationData]?;
    
    init(_data : CardData!, _relations : [RelationData]? = nil) {
        
        self.data = _data;
        self.relations = _relations;
    }
}
//
//  CarouselCard.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

public class CarouselCard : NSObject {
    
    var scene_id : Int!;
    var data : CardData!;
    var relations : [RelationData]?;
    
    init(_scene_id : Int, _data : CardData!, _relations : [RelationData]? = nil) {
        
        self.scene_id = _scene_id;
        self.data = _data;
        self.relations = _relations;
    }
}
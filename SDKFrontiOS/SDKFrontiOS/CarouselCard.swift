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
    var data : MiniCard!;
    var relations : [Relation]?;
    
    //TODO: Change To carruselCardData
    init(_scene_id : Int, _data : MiniCard!, _relations : [Relation]? = nil) {
        
        self.scene_id = _scene_id;
        self.data = _data;
        self.relations = _relations;
    }
}

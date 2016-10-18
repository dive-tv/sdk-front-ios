//
//  CarouselCellData.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 28/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class CarouselCellData : NSObject {
    
    var sceneId : Int!;
    var cards : [CarouselCard]!
    
    init(_sceneId : Int, _cards : [CarouselCard]!) {
        super.init();
        
        self.sceneId = _sceneId;
        self.cards = _cards;
    }
}
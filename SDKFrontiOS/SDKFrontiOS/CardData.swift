//
//  CardData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation

internal class CardData : NSObject {

    var cardId : String!;
    var title : String!;
    var type : TypeOfCard!;
    var image : String?;
    
    init(_cardId : String, _title : String, _type : TypeOfCard, _image : String? = nil) {
        
        self.cardId = _cardId;
        self.title = _title;
        self.type = _type;
        self.image = _image;
    }
}
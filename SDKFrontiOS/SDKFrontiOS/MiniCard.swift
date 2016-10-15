//
//  MiniCardData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 14/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class MiniCard : NSObject{

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

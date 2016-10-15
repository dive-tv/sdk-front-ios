//
//  CardData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class CardDetail : NSObject, Validatable{
    
    var cardId : String;
    var type : TypeOfCard;
    var locale : String;
    var title : String;
    var subtitle : String?;
    var image : Image?;
    var matchProduct : Product?;
    var products : [Product]?;
    var containers = Dictionary<ContainerContentType, ContainerData>();
    var relations = Dictionary<ContainerContentType, ContainerData>();
    
    
    init(_cardId : String, _type : String, _locale : String, _title : String, _image : Image? = nil) {
        
        self.cardId = _cardId;
        self.type = TypeOfCard(rawValue: _type)!;
        self.locale = _locale;
        self.title = _title;
        
        if(_image != nil){
            self.image = _image;
        }
    }
    
    init(data:JSON){
        //TODO: creación del objeto con el JSON
    }
    
    class func validate(data: JSON) throws -> Bool {
        
        //TODO: validar al menos card id, type y que sea un tipo conocido, locale y title. El resto es opcional
        return true;
    }
    
}

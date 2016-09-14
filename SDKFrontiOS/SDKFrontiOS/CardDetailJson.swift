//
//  CardDetailJson.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CardDetailJson : BaseCardDetailBuilder{
    
    // MARK: Init
    /**
     The initializer.
     
     - parameter styleConfig: This is optional, by default is nil. If the user wants a style for the CardDetail need to pass a json.
     
     - returns: self
     */
    override init( styleConfig : JSON? = nil) {
        super.init(styleConfig: styleConfig);
    }
    
    // MARK: Public Methods
    /**
     This method receive a json configured by the user.
     
     - parameter json: The json with the sections and modules the user wants to show
     
     - returns: Returns the CardDetailJson
     */
    public func loadDataConfig(json : JSON) -> CardDetailJson{
        
        
        if (json["main"] != nil){
            let mainJson = json["main"]
            for module in mainJson["modules"].arrayValue{
                if(module["type"] != nil){
                    self.addSimpleType(module);
                }
            }
        }
        return self;
    }
    
    private func addSimpleType(module : JSON){
        
        switch module["type"].string!{
        case JsonDatType.Actor.rawValue:
            
            break;
        case JsonDatType.Director.rawValue:
            
            break;
        case JsonDatType.Title.rawValue:
            
            break;
        case JsonDatType.Trailer.rawValue:
            
            break;
        case JsonDatType.Image.rawValue:
            
            break;
        case JsonDatType.Synopsis.rawValue:
            
            break;
        case JsonDatType.Gallery.rawValue:
            
            break;
        case JsonDatType.Rating.rawValue:
            
            break;
        case JsonDatType.Video.rawValue:
            
            break;
        case JsonDatType.Relation.rawValue:
            
            break;
        case JsonDatType.Award.rawValue:
            
            break;
        case JsonDatType.Product.rawValue:
            
            break;
        case JsonDatType.Navigation.rawValue:
            
            break;
        case JsonDatType.Tab.rawValue:
            
            break;
        default:
            break;
        }
    }
}
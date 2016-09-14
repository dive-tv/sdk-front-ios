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
        
        // TODO: need to build the dictSections with this json
        return self;
    }
    
    /*class func GetCarruselConfigLocal(){
        ServicesManager.sharedInstance.getLocal({ (data) -> Void in
            
            if(UIApplication.sharedApplication().applicationState == UIApplicationState.Active){
                
                if (data != nil) {
                    let json = JSON(data: data!);
                    completion(data: json);
                    
                } else {
                    completion(data: nil);
                }
            }
            else{
                NSLog("RESPONSE OF A SERVICE IN BACKGROUND BLOKED");
                completion(data: nil);
            }
            
            }, fileName: "CarruselConfig_v2");
    }*/
}
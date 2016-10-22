//
//  ContainerData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 15/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Container : NSObject, Validatable{

    var type : ContainerType;
    var contentType : ContainerContentType;
    var data : ContainerData;
    
    init(data: JSON){
        
        //validated variables
        self.type = ContainerType(rawValue: data["type"].object as! String)!;
        self.contentType = ContainerContentType(rawValue: data["content_type"].object as! String)!;
        
        //create a type of class for validate the data
        //let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String;
        //let _containerClass = NSClassFromString(appName + "." + (self.type.rawValue).capitalizedString  + "ContainerData") as! ContainerData.Type;
        
        //TODO: researdch the posibility to delete the switch
        
        switch self.type {
            case ContainerType.Text:
                self.data = TextContainerData(data: data["data"]);
            case ContainerType.Listing:
                self.data = ListingContainerData(data: data["data"]);
            case ContainerType.Rating:
                self.data = RatingContainerData(data: data["data"]);
            case ContainerType.Map:
                self.data = MapContainerData(data: data["data"]);
            case ContainerType.Link:
                self.data = LinkContainerData(data: data["data"]);
            case ContainerType.Image:
                self.data = ImageContainerData(data: data["data"]);
            case ContainerType.Awards:
                self.data = AwardsContainerData(data: data["data"]);
            case ContainerType.Catalog:
                self.data = CatalogContainerData(data: data["data"]);
            case ContainerType.Seasons:
                self.data = SeasonsContainerData(data: data["data"]);
        }
    }
    
    class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerErrors.emptyData);
            return;
        }
        
        guard case let (_type as String, _contentType as String, _containerData as JSON) = (_data["type"].object, _data["content_type"].object, _data["data"]) else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerErrors.invalidData);
            return;
        }
        
        guard let _containerType = ContainerType(rawValue: _type) else{
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerErrors.invalidContainerType);
            return;
        }
        
        if(ContainerContentType(rawValue: _contentType) == nil){
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerErrors.invalidContainerContentType);
        }
        
        //create a type of class for validate the data
        let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String;
        let _containerClass = NSClassFromString(appName + "." + (_containerType.rawValue).capitalizedString  + "ContainerData") as! ContainerData.Type;
        
        try _containerClass.validate(_containerData);
    }
}

//
//  RelationData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Relation : NSObject, Validatable {
    
    var type : RelationType;
    var contentType : RelationContentType;
    var data = [RelationData]();

    init(data:JSON){
        
        //validated variables
        self.type = RelationType(rawValue: data["type"].object as! String)!;
        self.contentType = RelationContentType(rawValue: data["content_type"].object as! String)!;
        
        //create a type of class for validate the data
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
        let _containerClass = NSClassFromString(appName + "." + (self.type.rawValue).capitalized  + "ContainerData") as! ContainerData.Type;
        
        for item in data["data"].array!{
            do{
                try _containerClass.validate(item);
                
                switch self.type {
                case RelationType.Single:
                    self.data.append(SingleRelationData(data: item));
                case RelationType.Duple:
                    self.data.append(DupleRelationData(data: item));
                }
            }
            catch DataModelErrors.CreateContainerDataErrors.emptyData{
                DataModelErrors.ShowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            }
            catch DataModelErrors.CreateContainerDataErrors.invalidData{
                DataModelErrors.ShowError(DataModelErrors.CreateContainerDataErrors.invalidData);
            }
            catch{
                DataModelErrors.UnreconigzedError();
            }
        }
    }
    
    class func validate(_ data: JSON?) throws {
        guard let _data = data , _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsErrors.emptyData);
            return;
        }
        
        guard case let (_type as String, _contentType as String, _containerData as [JSON]) = (_data["type"].object, _data["content_type"].object, _data["data"].array) , _type != "" && _contentType != "" && _containerData.count > 0 else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsErrors.invalidData);
            return;
        }
        
        guard let _relationType = RelationType(rawValue: _type) else{
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsErrors.invalidRelationType);
            return;
        }
        
        if(RelationContentType(rawValue: _contentType) == nil){
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsErrors.invalidRelationContentType);
        }
        
        //create a type of class for validate the data
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
        let _containerClass = NSClassFromString(appName + "." + (_relationType.rawValue).capitalized  + "RelationData") as! RelationData.Type;
        
        var validatedRelationData = 0;
        
        for item in _containerData{
            do{
                try _containerClass.validate(item);
                validatedRelationData += 1;
            }
            catch DataModelErrors.CreateRelationsDataErrors.emptyData{
                DataModelErrors.ShowError(DataModelErrors.CreateRelationsDataErrors.emptyData);
            }
            catch DataModelErrors.CreateRelationsDataErrors.invalidData{
                DataModelErrors.ShowError(DataModelErrors.CreateRelationsDataErrors.invalidData);
            }
            catch{
                DataModelErrors.UnreconigzedError();
            }
        }
        
        //if there isnt any containerData, the container is invalid
        if(validatedRelationData == 0){
            try DataModelErrors.ThrowError(DataModelErrors.CreateRelationsDataErrors.emptyData);
        }
    }
}

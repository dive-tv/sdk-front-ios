//
//  GrouppableTree.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 29/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class GrouppableTree : JSONValidatable{

    internal var type : TypeOfCard;
    internal var children : [GrouppableTree] = [GrouppableTree]();
    
    // MARK: Init
    init(data: JSON){
      
        //Add the type
        self.type =  TypeOfCard(rawValue: data["type"].object as! String)!;
        
        //Add the children
        for child in data["children"].arrayValue{
            
            do {
                try GrouppableTree.validate(child)
                self.children.append(GrouppableTree(data: child));
            }
            catch CarruselErrors.CreateGrouppableTreeErrors.invalidData{
                CarruselErrors.ShowError(CarruselErrors.CreateGrouppableTreeErrors.invalidData);
                //Some recover error coding
            }
            catch{
                CarruselErrors.UnreconigzedError();
            }
        }
    }
    
    // MARK: Protocols implementation
    class func validate(_ data : JSON) throws{
        guard case let (_children as [JSON], _type as String) = (data["children"].arrayValue, data["type"].object)
            , _type != "" else {
                
                //ThrowError
                try CarruselErrors.ThrowError(CarruselErrors.CreateGrouppableTreeErrors.invalidData);
                return;
        }
    }
    
}

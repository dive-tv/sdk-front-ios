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
            catch{
                //Some recover error coding
            }
        }
    }
    
    // MARK: Protocols implementation
    class func validate(data : JSON) throws{
        guard case let (_children as [JSON], _type as String) = (data["children"].arrayValue, data["type"].object)
            where _type != "" else {
                
                //ThrowError
                try CarruselErrors.ThrowError(CarruselErrors.GrouppableTreeErrors.invalidData);
                return;
        }
    }
    
}
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
    
    var type : ContainerType?;
    var contentType : ContainerContentType?;
    var data : RelationData?;

    init(_data:JSON){
        //TODO: construir el objeto con el json
    }
    
    class func validate(data: JSON) throws -> Bool {
        //TODO: comprobar type, su content type y su relationData.
        //TODO: asignar un tipo de error y propagarlo
        return true;
    }
}

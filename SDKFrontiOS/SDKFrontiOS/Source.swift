//
//  SourceData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 15/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Source : Validatable{
    var name : String;
    var url : String?;
    var disclaimer : String?;
    var image : String?;
    
    init(data:JSON){
        
        //validated variables
        self.name = data["name"].object as! String;
        
        //non validated variables
        if let _url = data["url"].object as? String where _url != ""{
            self.url = _url;
        }
        
        if let _disclaimer = data["disclaimer"].object as? String where _disclaimer != ""{
            self.disclaimer = _disclaimer;
        }
        
        if let _image = data["image"].object as? String where _image != ""{
            self.image = _image;
        }
    }
    
    class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateSourceErrors.emptyData);
            return;
        }
        
        if(_data["name"].object as? String == nil){
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateImageErrors.invalidData);
        }
        
    }
}

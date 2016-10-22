//
//  ImageData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 15/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Image : Validatable{
    
    var thumb : String;
    var full : String;
    var anchorX : Int;
    var anchorY : Int;
    var source : Source?;
    
    init(data:JSON){
        
        //validated variables
        self.thumb = data["thumb"].object as! String;
        self.full = data["full"].object as! String;
        self.anchorX = data["anchor_x"].intValue;
        self.anchorY = data["anchor_y"].intValue;
        
        //non validated variables
        let _source = data["source"];
        
        do{
            try Source.validate(_source);
            self.source = Source(data: _source);
        }
        catch DataModelErrors.CreateSourceErrors.emptyData{
            DataModelErrors.ShowError(DataModelErrors.CreateSourceErrors.emptyData);
        }
        catch DataModelErrors.CreateSourceErrors.invalidData{
            DataModelErrors.ShowError(DataModelErrors.CreateSourceErrors.invalidData);
        }
        catch{
            DataModelErrors.UnreconigzedError();
        }
    }
    
    class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateImageErrors.emptyData);
            return;
        }
        
        guard case let (_thumb as String, _full as String) = (_data["thumb"].object, _data["full"].object)
            where _thumb != "" && _full != "" && _data["anchor_x"].int != nil && _data["anchor_y"].int != nil else{
                //Throw indavilData Error
                try DataModelErrors.ThrowError(DataModelErrors.CreateImageErrors.invalidData);
                return;
        }
    }
}

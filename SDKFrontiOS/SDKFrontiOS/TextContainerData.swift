//
//  TextContainerData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class TextContainerData : ContainerData{
    
    var text : String;
    var source : Source?;
    
    init(data: JSON){
        
        //validate variables
        self.text = data["text"].object as! String;
        
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
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateTextContainerErrors.emptyData);
            return;
        }
        
        if(_data["text"].object as? String != nil && _data["source"] != nil){
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateImageErrors.invalidData);
        }
    }
}

class ListingContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class RatingContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class MapContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class LinkContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class AdwardsContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class CatalogContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class SeasonsContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

class ImageContainerData : ContainerData{
    
    override init(){
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        
    }
}

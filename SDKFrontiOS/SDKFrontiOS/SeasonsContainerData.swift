//
//  SeasonContainerData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class SeasonsContainerData : ContainerData{
    
    var seasonIndex : Int;
    var chapterNr : Int;
    var creators : String?;
    var image : Image?;
    var year : Int;
    
    init(data: JSON){
        
        //validated variables
        self.seasonIndex = data["season_index"].intValue;
        self.chapterNr = data["chapter_nr"].intValue;
        self.year = data["year"].intValue;
        
        //non validated variables
        if let _creators = data["creators"].object as? String where _creators != ""{
            self.creators = _creators;
        }
        
        //Create image
        let _image = data["image"];
        
        if(_image != nil){
            do{
                //validate data
                try Image.validate(_image);
                self.image = Image(data: _image);
            }
            catch DataModelErrors.CreateImageErrors.emptyData{
                DataModelErrors.ShowError(DataModelErrors.CreateImageErrors.emptyData);
                //Some recover code
            }
            catch DataModelErrors.CreateImageErrors.invalidData{
                DataModelErrors.ShowError(DataModelErrors.CreateImageErrors.invalidData);
                //Some recover code
            }
            catch{
                //Throw error for validate
                DataModelErrors.UnreconigzedError();
                //Some recorver code
            }
        }
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        if(_data["season_index"].int == nil || _data["chapter_nr"].int == nil || _data["year"].int == nil){
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
        }
    }
}


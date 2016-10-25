//
//  CatalogContainerData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

class CatalogContainerData : ContainerData{
    
    var backGroundImage : String?;
    var director : String;
    var genres = [String]();
    var originalTitle : String;
    var runtime : Int;
    var year : Int;
    var sync : Sync?;
    var creators : String?;
    var serieTitle : String?;
    var chapterIndex : Int?;
    var seasonIndex : Int?;
    
    init(data: JSON){
        
        //validated variables
        self.director = data["director"].object as! String;
        self.originalTitle = data["original_title"].object as! String;
        self.runtime = data["runtime"].intValue;
        self.year = data["year"].intValue;
        
        //non validated variables
        if let _backGroundImage = data["background_image"].object as? String where _backGroundImage != ""{
            self.backGroundImage = _backGroundImage;
        }
        
        if let _genres = data["genres"].array where _genres.count > 0{
            for item in _genres{
                if let _genre = item.object as? String where _genre != ""{
                    self.genres.append(_genre);
                }
            }
        }
        
        let _sync = data["sync"];
        
        if(_sync != nil){
            do{
                try Sync.validate(_sync);
                self.sync = Sync(data: _sync);
            }
            catch DataModelErrors.CreateSyncErrors.emptyData{
                DataModelErrors.ShowError(DataModelErrors.CreateSyncErrors.emptyData);
            }
            catch DataModelErrors.CreateSyncErrors.invalidData{
                DataModelErrors.ShowError(DataModelErrors.CreateSyncErrors.invalidData);
            }
            catch{
                DataModelErrors.UnreconigzedError();
            }
        }
        
        if let _creators = data["creators"].object as? String where _creators != ""{
            self.creators = _creators;
        }
        
        if let _serieTitle = data["serie_title"].object as? String where _serieTitle != ""{
            self.serieTitle = _serieTitle;
        }
        
        if let _chapterIndex = data["chapter_index"].int{
            self.chapterIndex = _chapterIndex;
        }
        
        if let _seasonIndex = data["season_index"].int{
            self.seasonIndex = _seasonIndex;
        }
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        guard case let (_director as String, _originalTitle as String) = (_data["director"].object, _data["original_title"].object)
            where _director != "" && _originalTitle != "" && _data["runtime"].int != nil && _data["year"].int != nil else{
                //Throw indavilData Error
                try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
                return;
        }
    }
}

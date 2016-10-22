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
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        if(_data["text"].object as? String == nil){
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
        }
    }
}

class ListingContainerData : ContainerData{
    
    var text : String;
    var value : String;
    
    init(data: JSON){
        
        //validate variables
        self.text = data["text"].object as! String;
        self.value = data["value"].object as! String;
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        guard case let (_text as String, _value as String) = (_data["text"].object, _data["value"].object)
            where _text != "" || _value != "" else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
            return;
        }
    }
}

class RatingContainerData : ContainerData{
    
    var value : Int;
    var source : Source?;
    
    init(data: JSON){
        
        //validate variables
        self.value = data["value"].intValue;
        
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
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        if let _value = _data["value"].object as? String
            where _value != ""{
                //Throw indavilData Error
                try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
                return;
        }
    }
}

class MapContainerData : ContainerData{
    
    var latitude : Float;
    var longitude : Float;
    var zoom : Float;
    
    init(data: JSON){
        
        //validate variables
        self.latitude = data["latitude"].floatValue;
        self.longitude = data["longitude"].floatValue;
        self.zoom = data["zoom"].floatValue;
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
    
        if(_data["latitude"].float == nil || _data["longitude"].float == nil || _data["zoom"].float == nil){
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
        }
    }
}

class LinkContainerData : ContainerData{
    
    var link : String;
    var source : Source?;
    
    init(data: JSON){
        
        //validate variables
        self.link = data["link"].object as! String;
        
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
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        if let _link = _data["link"].object as? String
            where _link != ""{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
            return;
        }
    }
}

class ImageContainerData : ContainerData{
    
    var image : Image;
    
    init(data: JSON){
        
        //validate variables
        self.image = Image(data: data["image"]);
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        let _image = _data["image"];
        try Image.validate(_image);
    }
}

class AwardsContainerData : ContainerData{
    
    var title : String;
    var nominee = [ListingContainerData]();
    var winner = [ListingContainerData]();
    
    init(data: JSON){
        
        //validate variables
        self.title = data["title"].object as! String;
        
        let _nominee = data["nominee"].arrayValue;
        
        for _item in _nominee{
            do{
                try ListingContainerData.validate(_item);
                self.nominee.append(ListingContainerData(data: _item));
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
        
        let _winner = data["winner"].arrayValue;
        
        for _item in _winner{
            do{
                try ListingContainerData.validate(_item);
                self.nominee.append(ListingContainerData(data: _item));
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
        
        super.init();
    }
    
    override class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.emptyData);
            return;
        }
        
        guard case let (_title as String, _nominee as [JSON], _winner as [JSON]) = (_data["title"].object, _data["nominee"].array, _data["winner"].array)
            where _title != "" && (_nominee.count > 0 || _winner.count > 0) else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateContainerDataErrors.invalidData);
            return;
        }
    }
}

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


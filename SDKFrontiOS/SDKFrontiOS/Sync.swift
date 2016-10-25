//
//  Sync.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 22/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Sync : NSObject, Validatable{
    
    var isSynchronizable : Bool;
    var audioLangs = [String]();
    var channels = [TVEvent]();
    
    init(data: JSON){
        
        //validated variables
        self.isSynchronizable = data["is_synchronizable"].boolValue;
        
        //non validated variables
        if let _audioLangs = data["audio_langs"].array where _audioLangs.count > 0{
            for item in _audioLangs{
                if let _audiolang = item.object as? String where _audiolang != ""{
                    self.audioLangs.append(_audiolang);
                }
            }
        }
        
        if let _channels = data["channels"].array where _channels.count > 0{
            
            for _channel in _channels{
                do{
                    try TVEvent.validate(_channel);
                    self.channels.append(TVEvent(data: _channel));
                }
                catch DataModelErrors.CreateTVEventErrors.invalidData{
                    DataModelErrors.ShowError(DataModelErrors.CreateTVEventErrors.invalidData);
                    //Some recover code
                }
                catch DataModelErrors.CreateTVEventErrors.emptyData{
                    DataModelErrors.ShowError(DataModelErrors.CreateTVEventErrors.emptyData);
                    //Some recover code
                }
                catch DataModelErrors.CreateMiniCardErrors.invalidData{
                    DataModelErrors.ShowError(DataModelErrors.CreateMiniCardErrors.invalidData);
                    //Some recover code
                }
                catch DataModelErrors.CreateMiniCardErrors.emptyData{
                    DataModelErrors.ShowError(DataModelErrors.CreateMiniCardErrors.emptyData);
                    //Some recover code
                }
                catch DataModelErrors.CreateMiniCardErrors.invalidTypeOfCard{
                    DataModelErrors.ShowError(DataModelErrors.CreateMiniCardErrors.emptyData);
                    //Some recover code
                }
                catch{
                    //Throw error for validate
                    DataModelErrors.UnreconigzedError();
                    //Some recorver code
                }
            }
        }
        
        super.init();
    }
    
    class func validate(data: JSON?) throws{
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateSyncErrors.emptyData);
            return;
        }
        
        if(_data["is_synchronizable"].bool == nil){
            try DataModelErrors.ThrowError(DataModelErrors.CreateSyncErrors.invalidData);
        }
    }
}

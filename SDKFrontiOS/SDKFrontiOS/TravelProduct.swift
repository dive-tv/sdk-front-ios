//
//  TravelProductData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 14/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class TravelProduct : Product{
    var country : String?;
    var region : String?;
    var city : String?;
    var address : String?
    var postalCode : Int?;
    var rating : Float?;
    
    
    override init(data: JSON){
        
        //non validate variables
        if let _country = data["country"].object as? String where _country != ""{
            self.country = _country;
        }
        
        if let _region = data["region"].object as? String where _region != ""{
            self.region = _region;
        }
        
        if let _city = data["city"].object as? String where _city != ""{
            self.city = _city;
        }
        
        if let _address = data["address"].object as? String where _address != ""{
            self.address = _address;
        }
        
        if let _postalCode = data["postalCode"].int{
            self.postalCode = _postalCode;
        }
        
        if let _rating = data["rating"].float{
            self.rating = _rating;
        }
        
        super.init(data: data);
    }
    
    override class func validate(data: JSON?) throws{
        
        try super.validate(data);
    }
}

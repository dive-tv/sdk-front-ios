//
//  ProductData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 14/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class Product : Validatable{
    var productId : String;
    var category : ProductCategory;
    var title : String;
    var merchant : String;
    var image : String;
    var url : String;
    var price : Float;
    var currency : String;
    
    init(data: JSON){
        //validated variables
        self.productId = data["product_id"].object as! String;
        self.category = ProductCategory(rawValue: data["category"].object as! String)!;
        self.title = data["title"].object as! String;
        self.merchant = data["merchant"].object as! String;
        self.image = data["image"].object as! String;
        self.url = data["url"].object as! String;
        self.price = data["price"].floatValue;
        self.currency = data["currency"].object as! String;
        
    }
    
    class func validate(data: JSON?) throws {
    
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateProductErrors.emptyData);
            return;
        }
        
        guard case let (_productId as String, _category as String, _title as String, _merchant as String, _image as String, _url as String, _price as Float, _currency as String) = (_data["product_id"].object, _data["category"].object, _data["title"].object, _data["merchant"].object, _data["image"].object, _data["url"].object, _data["price"].float, _data["currency"].object)
            where _productId != "" && _category != "" && _title != "" && _merchant != "" && _image != "" && _url != "" && _currency != "" else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateProductErrors.invalidData);
            return;
        }
        
        if(ProductCategory(rawValue: _category) != nil){
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateProductErrors.invalidCategoryOfProduct);
        }
        
    }
}

//
//  CardData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class CardDetail : NSObject, Validatable{
    
    var cardId : String;
    var type : TypeOfCard;
    var locale : String;
    var title : String;
    
    var subtitle : String?;
    var image : Image?;
    var products = [Product]();
    var containers = Dictionary<ContainerContentType, ContainerData>();
    var relations = Dictionary<ContainerContentType, ContainerData>();
    
    /*lazy var matchProduct{
        get{
            if(self == nil){
                for product in products{
                    if(product.)
                }
            }
        }
    }*/
    
    init(_cardId : String, _type : String, _locale : String, _title : String, _image : Image? = nil) {
        
        self.cardId = _cardId;
        self.type = TypeOfCard(rawValue: _type)!;
        self.locale = _locale;
        self.title = _title;
        
        if(_image != nil){
            self.image = _image;
        }
    }
    
    init(data:JSON){
        
        //validated variables
        self.cardId = data["card_id"].object as! String;
        self.type = TypeOfCard(rawValue: data["type"].object as! String)!;
        self.locale = data["locale"].object as! String;
        self.title = data["title"].object as! String;
        
        //non validate variables
        if let _subtitle = data["subtitle"].object as? String where _subtitle != ""{
            self.subtitle = _subtitle;
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
        
        //Create products
        if let _products = data["products"].array where _products.count > 0{
            for product in _products{
                
                if let _category = product["category"].object as? String where _category == "travel"{
                    do{
                        try TravelProduct.validate(product);
                        self.products.append(TravelProduct(data: product));
                    }
                    catch DataModelErrors.CreateProductErrors.invalidCategoryOfProduct{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.invalidCategoryOfProduct);
                        //Some recover code

                    }
                    catch DataModelErrors.CreateProductErrors.invalidData{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.invalidData);
                        //Some recover code

                    }
                    catch DataModelErrors.CreateProductErrors.emptyData{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.emptyData);
                        //Some recover code

                    }
                    catch{
                        //Throw error for validate
                        DataModelErrors.UnreconigzedError();
                        //Some recorver code
                    }
                }
                else{
                    do{
                        try ItemProduct.validate(product);
                        self.products.append(ItemProduct(data: product));
                    }
                    catch DataModelErrors.CreateProductErrors.invalidCategoryOfProduct{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.invalidCategoryOfProduct);
                        //Some recover code

                    }
                    catch DataModelErrors.CreateProductErrors.invalidData{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.invalidData);
                        //Some recover code

                    }
                    catch DataModelErrors.CreateProductErrors.emptyData{
                        DataModelErrors.ShowError(DataModelErrors.CreateProductErrors.emptyData);
                        //Some recover code

                    }
                    catch{
                        //Throw error for validate
                        DataModelErrors.UnreconigzedError();
                        //Some recorver code
                    }
                }
            }
        }
        
        //Create Containers
        
        
        
    }
    
    class func validate(data: JSON?) throws{
        
        guard let _data = data where _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
        
        guard case let (_ as String, _type as String, _ as String, _ as String) = (_data["card_id"].object, _data["type"].object, _data["locale"].object, _data["title"].object) else{
            //Throw indavilData Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.invalidData);
            return;
        }
        
        if(TypeOfCard(rawValue: _type) == nil){
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.invalidTypeOfCard);
        }
    }
    
}

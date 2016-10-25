//
//  MiniCardData.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 14/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class MiniCard : NSObject, Validatable{

    var cardId : String;
    var type : TypeOfCard;
    var locale : String;
    var title : String;
    var subTitle : String?;
    var image : Image?;
    var products = [Product]();
    var paginateKey : String?;
    
    init(data: JSON){
        
        //validated variables
        self.cardId = data["card_id"].object as! String;
        self.type = TypeOfCard(rawValue: data["type"].object as! String)!;
        self.locale = data["locale"].object as! String;
        self.title = data["title"].object as! String;

        //non validated variables
        if let _subTitle = data["subTitle"].object as? String , _subTitle != ""{
            self.subTitle = _subTitle;
        }
        
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
        
        if let _products = data["products"].array , _products.count > 0{
            for _product in _products{
                if let _category = _product["category"].object as? String , _category == "travel"{
                    do{
                        try TravelProduct.validate(_product);
                        self.products.append(TravelProduct(data: _product));
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
                        try ItemProduct.validate(_product);
                        self.products.append(ItemProduct(data: _product));
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
        
        if let _paginateKey = data["paginate_key"].object as? String , _paginateKey != ""{
            self.paginateKey = _paginateKey;
        }
        
        super.init();
    }
    
    class func validate(_ data: JSON?) throws{
        guard let _data = data , _data != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateMiniCardErrors.emptyData);
            return;
        }
        
        guard case let (_cardId as String, _type as String, _locale as String, _title as String) = (_data["card_id"].object, _data["type"].object, _data["locale"].object, _data["title"].object)
            , _cardId != "" && _type != "" && _locale != "" && _title != ""  else{
                //Throw indavilData Error
                try DataModelErrors.ThrowError(DataModelErrors.CreateMiniCardErrors.invalidData);
                return;
        }
        
        if(TypeOfCard(rawValue: _type) == nil){
            //Throw invalid type of card Error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.invalidTypeOfCard);
        }

    }
}


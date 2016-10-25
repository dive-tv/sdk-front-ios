//
//  CarouselLogic.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 28/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

internal class CarouselLogic : NSObject, JSONValidatable {
    
    fileprivate var trees : [TypeOfCard : GrouppableTree];
    
    // MARK: Init
    override init() {
        
        trees = [TypeOfCard : GrouppableTree]();
        super.init();
        
        //load the Grouppable Trees
        self.loadGrouppableTrees()
        
        print("DONE");
    }
 
    // MARK; Deinit
    deinit {
        print("CAROUSEL LOGIC DEINIT")
    }
    
    // MARK: Private funcs
    fileprivate func loadGrouppableTrees () {
        
        let jsonFilePath:String = Bundle.main.path(forResource: "groupabletree", ofType: "json")! as String
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) {
            let json = JSON(data: data);
            
            //Validate the Json
            do{
                try CarouselLogic.validate(json);
                
                //Create the grouppable Trees
                for tree in json["trees"].array! {
                    
                    do{
                        try GrouppableTree.validate(tree)
                        
                        self.trees[TypeOfCard( rawValue: tree["type"].object as! String)!] = GrouppableTree(data: tree);
                        //self.trees.append(GrouppableTree(data: self));
                        
                    }
                    catch CarruselErrors.CreateGrouppableTreeErrors.invalidData{
                        CarruselErrors.ShowError(CarruselErrors.CreateGrouppableTreeErrors.invalidData);
                    }
                    catch{
                        CarruselErrors.UnreconigzedError();
                    }
                }
            }
            catch CarruselErrors.CreateGrouppableTreeErrors.emptyData{
                CarruselErrors.ShowError(CarruselErrors.CreateGrouppableTreeErrors.emptyData);
                //Some recover error code
            }
            catch{
                CarruselErrors.UnreconigzedError();
            }
        }
        
        /*let jsonData:Data = Data.dataWithContentsOfMappedFile(jsonFilePath as String) as! Data;
        let json = JSON(data: jsonData);*/
        
        
    }
    
    // MARK: Protocols implementation
    class func validate(_ data : JSON) throws{
        
        guard case let (trees as [JSON]) = (data["trees"].array)
            , trees.count > 0 else {
                
                //ThrowError
                try CarruselErrors.ThrowError(CarruselErrors.CreateGrouppableTreeErrors.emptyData);
                
                return;
        }
        
    }
}

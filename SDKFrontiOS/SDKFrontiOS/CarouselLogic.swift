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
    
    private var trees : [TypeOfCard : GrouppableTree];
    
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
    private func loadGrouppableTrees () {
        
        let jsonFilePath:NSString = NSBundle.mainBundle().pathForResource("groupabletree", ofType: "json")!
        let jsonData:NSData = NSData.dataWithContentsOfMappedFile(jsonFilePath as String) as! NSData;
        let json = JSON(data: jsonData);
        
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
    
    // MARK: Protocols implementation
    class func validate(data : JSON) throws{
        
        guard case let (trees as [JSON]) = (data["trees"].array)
            where trees.count > 0 else {
                
                //ThrowError
                try CarruselErrors.ThrowError(CarruselErrors.CreateGrouppableTreeErrors.emptyData);
                
                return;
        }
        
    }
}

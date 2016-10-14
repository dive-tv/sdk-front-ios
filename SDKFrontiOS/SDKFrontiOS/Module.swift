//
//  Module.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import UIKit

public class Module : UITableViewCell, Validatable{
    
    internal var cardDetailData : CardDetailData!;
    internal var configModule : ConfigModule!;
    
    weak var sectionDelegate : SectionDelegate?;
    weak var cardDelegate : CardDetailDelegate?;
    
    /**
     sets the data for the cell and configures the cell.
     
     - parameter _configModule: the configuration of the module
     - parameter _cardData:     the data to display in the cell
     */
    func setCardDetailData (_configModule : ConfigModule, _cardDetailData : CardDetailData) {
        
        if (self.cardDetailData == nil) {
            
            let randomRed:CGFloat = CGFloat(drand48()) - 0.10;
            
            let randomGreen:CGFloat = CGFloat(drand48()) - 0.10;
            
            let randomBlue:CGFloat = CGFloat(drand48()) - 0.10;
            
            self.contentView.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
        
        self.cardDetailData = _cardDetailData;
        self.configModule = _configModule;
    }
    
    class func validate(data: CardDetailData) throws {
        
        /*guard case let (trees as [JSON]) = (data["trees"].array)
            where trees.count > 0 else {
                
                //ThrowError
                try CardDetailErrors.ThrowError(CardDetailErrors.CreateCardDetailErrors.invalidData);
                return;
        }*/
    }

}

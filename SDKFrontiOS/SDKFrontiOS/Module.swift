//
//  Module.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import UIKit

public class Module : UITableViewCell, Validatable{
    
    internal var cardData : CardData!;
    internal var configModule : ConfigModule!;
    
    weak var sectionDelegate : SectionDelegate?;
    weak var cardDelegate : CardDetailDelegate?;
    
    /**
     sets the data for the cell and configures the cell.
     
     - parameter _configModule: the configuration of the module
     - parameter _cardData:     the data to display in the cell
     */
    func setCardData (_configModule : ConfigModule, _cardData : CardData) {
        
        if (self.cardData == nil) {
            
            let randomRed:CGFloat = CGFloat(drand48()) - 0.10;
            
            let randomGreen:CGFloat = CGFloat(drand48()) - 0.10;
            
            let randomBlue:CGFloat = CGFloat(drand48()) - 0.10;
            
            self.contentView.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
        
        self.cardData = _cardData;
        self.configModule = _configModule;
    }
    
    class func validate(data: CardData) throws -> Bool {
        return true;
    }

}

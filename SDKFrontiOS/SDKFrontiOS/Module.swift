//
//  Module.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import UIKit

public class Module : UITableViewCell{
    
    internal var cardData : CardData!;
    internal var configModule : ConfigModule!;
    
    weak var sectionDelegate : SectionDelegate?;
    weak var cardDelegate : CardDetailDelegate?;
    
    public override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    func setCardData (_configModule : ConfigModule, _cardData : CardData) {
        
        self.cardData = _cardData;
        self.configModule = _configModule;
    }

}
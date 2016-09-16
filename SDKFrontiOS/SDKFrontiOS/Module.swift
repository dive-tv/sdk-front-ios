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
    
    public override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    func setCardData (_cardData : CardData) {
        
        self.cardData = _cardData;
    }

}
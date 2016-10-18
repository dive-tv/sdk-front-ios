//
//  ActorModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class ActorModule: Module {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCardData(_configModule: ConfigModule, _cardData: CardData) {
        super.setCardData(_configModule, _cardData: _cardData);
        
        self.contentView.backgroundColor = UIColor.redColor();
    }
    
}

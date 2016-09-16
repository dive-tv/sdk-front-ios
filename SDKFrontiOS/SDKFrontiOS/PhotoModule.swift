//
//  PhotoModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 14/9/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import UIKit

public class PhotoModule: Module {

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setCardData(_cardData: CardData) {
        super.setCardData(_cardData);
        
        self.contentView.backgroundColor = UIColor.redColor();
    }
    
}

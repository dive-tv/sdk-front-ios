//
//  Description.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Description: TextModule {

    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Description] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.textView?.backgroundColor = UIColor.yellowColor();
        
        // TODO: need to put the localizable strings
        self.textView?.headerLabel.text = "Descripción".uppercaseString;
        
        // TODO: need to know when show the button all description
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Description], textContainer = container.data.first as? TextContainerData{
            self.textView?.contentLabel.text = textContainer.text;
            self.setSource(textContainer.source);
        }
        
        
    }
    
}

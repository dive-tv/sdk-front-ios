//
//  Awards.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 18/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Awards: VerticalListModule {

    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Awards] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Awards], awardsContainer = container.data.first as? AwardsContainerData{
            // TODO: need to do the logic
        }
        
        
    }
    
}

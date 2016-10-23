//
//  Seasons.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Seasons: HorizontalListModule {
    
    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Seasons] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Seasons], seasonsContainer = container.data.first as? SeasonsContainerData{
            // TODO: need to do the logic
        }
        
        
    }
}

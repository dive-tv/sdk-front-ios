//
//  Specifications.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Specifications: TwoColsModule {

    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Specs] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        self.verticalListView?.labelTitleModule.text = "Especificaciones".uppercaseString;
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Specs]{
            self.verticalListView?.setDataSpecs(container.data as! [ListingContainerData]);
        }
        
        
    }
    
}

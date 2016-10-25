//
//  Biography.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Biography: TextModule {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Biography] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.viewBackground.backgroundColor = UIColor.black;
        
        // TODO: need to put the localizable strings
        self.headerLabel.text = "Biografia".uppercased();
        
        // TODO: need to know when show the button all description
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Biography], let textContainer = container.data.first as? TextContainerData{
            self.contentLabel.text = textContainer.text;
            self.setSource(textContainer.source);
        }
        
        
    }
    
}

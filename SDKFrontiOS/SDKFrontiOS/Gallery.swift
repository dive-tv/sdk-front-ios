//
//  Gallery.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Gallery: Module {
    
    var galleryView : GalleryView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.galleryView = NSBundle.mainBundle().loadNibNamed("GalleryView", owner: self, options: nil)?[0] as? GalleryView;
        
        self.contentView.addSubview(self.galleryView!);
        self.galleryView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.galleryView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.galleryView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Gallery] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Gallery], imageContainer = container.data.first as? ImageContainerData{
            // TODO: need to do the logic
        }
        
        
    }
    
}

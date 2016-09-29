//
//  PhotoAndTitleView.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class PhotoAndTitleView: CarouselView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func setView(_data : CarouselCard) {
        super.setView(_data);
        
        self.title.text = _data.data.title;
        
    }
    
}

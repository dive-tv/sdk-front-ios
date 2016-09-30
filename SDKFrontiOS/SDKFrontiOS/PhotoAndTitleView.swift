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
        
        
        if (_data.data.image != nil && !_data.data.image!.isEmpty) {
            
            var urlArray = _data.data.image!.componentsSeparatedByString(".");
            urlArray[0] += "_s_@3x"
            
            let touchvieUrl = "https://card.touchvie.com/" + urlArray[0] + "." + urlArray[1];
            
            let url = NSURL(string: touchvieUrl)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                if let data = NSData(contentsOfURL: url!) {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageView.image = UIImage(data: data);
                    });
                }
            }
            
        }
    }
    
}

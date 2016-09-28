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
    
    deinit {
        print("view removed");
    }
    
    //This is for testing
    override func setView(_data : String) {
        super.setView(_data);
        
        self.title.text = "Test";
        self.imageView.image = UIImage(named: _data);
    }
}

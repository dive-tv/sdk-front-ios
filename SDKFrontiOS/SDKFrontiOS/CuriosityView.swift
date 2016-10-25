//
//  CuriosityView.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class CuriosityView: CarouselView {

    @IBOutlet weak var titleCell: UILabel!
    
    override func setView(_ _data: CarouselCard) {
        super.setView(_data);
        
        self.titleCell.text = _data.data.title;
        
    }

}

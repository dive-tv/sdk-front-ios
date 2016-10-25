//
//  CarouselView.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class CarouselView: UIView {

    
    deinit {
        print("view removed");
    }
    
    
    /**
     sets the view info
     
     - parameter _data: data of the card
     */
    func setView (_ _data : CarouselCard ) {
        // NEED TO DO THE ANIMATION
    }

}


extension CarouselView {
    class func loadFromNibNamed(_ type: CarouselViewType, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: type.rawValue,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}

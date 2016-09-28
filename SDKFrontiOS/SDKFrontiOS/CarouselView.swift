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
    
    
    // this is for testing
    func setView (_data : String ) {
        // NEED TO DO THE ANIMATION
    }

}


extension CarouselView {
    class func loadFromNibNamed(type: CarouselViewType, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: type.rawValue,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}

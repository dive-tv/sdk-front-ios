//
//  ShopView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class ShopView: UIView {

    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var viewPriceAndShop : UIView!;
    @IBOutlet weak var labelPrice : UILabel!;
    @IBOutlet weak var labelShop : UILabel!;

    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    func setData(product : Product){
        // TODO: download the image
        
        self.labelPrice.text = "\(product.price)€";
        self.labelShop.text = product.merchant;
    }
    
}

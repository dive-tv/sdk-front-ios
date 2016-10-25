//
//  TravelShop.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TravelShop: HorizontalListModule {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        if cardDetail.products.count == 0{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
        // Check if the products are from travel
        var products = [Product]();
        for product in cardDetail.products{
            if(product.category == ProductCategory.Travel){
                products.append(product);
            }
        }
        
        if products.count == 0{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if cardDetail.products.count > 0{
            
            for subview in scrollView.subviews {
                subview.removeFromSuperview();
            }
            
            // Check if the products are from travel
            var products = [Product]();
            for product in cardDetail.products{
                if(product.category == ProductCategory.Travel){
                    products.append(product);
                }
            }
            
            
            self.heightScrollViewConstraint.constant = 250;
            self.itemWidth = 220;
            self.labelModuleTitle.text = "Alojamientos".uppercased();
            
            
            self.viewBackground.backgroundColor = UIColor.green;
            self.addItemToScrollView(products);
            
            let width = (CGFloat(cardDetail.products.count) * (self.itemWidth + 10)) + 15 + 5;
            self.layoutScrollView(width);
            
        }
        
    }
    
    
    // MARK: Private Methods
    fileprivate func addItemToScrollView(_ products : [Product]){
        for i in 0 ..< products.count {
            
            let item = Bundle.main.loadNibNamed("TravelShopView", owner: self, options: nil)![0] as? TravelShopView
            
            self.scrollView.addSubview(item!);
            
            item!.setData(products[i] as! TravelProduct);
            
            self.setScrollItemConstraints(i, item: item!);
            
            item!.layoutSubviews();
            item!.layoutIfNeeded();
        }
    }
    
}

//
//  Shop.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Shop: HorizontalListModule {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override class func validate(cardDetail : CardDetail) throws {
        if cardDetail.products.count == 0{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
        // Check if the products aren't from travel
        var products = [Product]();
        for product in cardDetail.products{
            if(product.category != ProductCategory.Travel){
                products.append(product);
            }
        }
        
        if products.count == 0{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if cardDetail.products.count > 0{
            
            for subview in scrollView.subviews {
                subview.removeFromSuperview();
            }
            
            // Check if the products aren't from travel
            var products = [Product]();
            for product in cardDetail.products{
                if(product.category != ProductCategory.Travel){
                    products.append(product);
                }
            }
            
            
            self.heightScrollViewConstraint.constant = 185;
            self.itemWidth = 144;
            self.labelModuleTitle.text = "Tienda".uppercaseString;
        
            
            self.viewBackground.backgroundColor = UIColor.greenColor();
            self.addItemToScrollView(products);
            
            let width = (CGFloat(cardDetail.products.count) * (self.itemWidth + 10)) + 15 + 5;
            self.layoutScrollView(width);
            
        }
        
    }
    
    
    // MARK: Private Methods
    private func addItemToScrollView(products : [Product]){
        for i in 0 ..< products.count {
            
            let item = NSBundle.mainBundle().loadNibNamed("ShopView", owner: self, options: nil)![0] as? ShopView
            
            self.scrollView.addSubview(item!);
            
            item!.setData(products[i]);
            
            self.setScrollItemConstraints(i, item: item!);
            
            item!.layoutSubviews();
            item!.layoutIfNeeded();
        }
    }
}

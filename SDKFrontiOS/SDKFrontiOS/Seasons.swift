//
//  Seasons.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Seasons: HorizontalListModule {
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Seasons] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Seasons]{
            
            for subview in scrollView.subviews {
                subview.removeFromSuperview();
            }
            
            self.heightScrollViewConstraint.constant = 221;
            self.itemWidth = 110;
            
            self.labelModuleTitle.text = "Temporadas".uppercaseString;
            self.viewBackground.backgroundColor = UIColor.redColor();
            self.addItemToScrollView(container.data as! [SeasonsContainerData]);
            
            let width = (CGFloat(container.data.count) * (self.itemWidth + 10)) + 15 + 5;
            self.layoutScrollView(width);
            
        }
        
    }
    
    
    
    // MARK: Private Methods
    private func addItemToScrollView(seasons : [SeasonsContainerData]){
        for i in 0 ..< seasons.count {
            
            let item = NSBundle.mainBundle().loadNibNamed("SeasonsView", owner: self, options: nil)![0] as? SeasonsView
            
            self.scrollView.addSubview(item!);
            
            item!.setData(seasons[i]);
            
            self.setScrollItemConstraints(i, item: item!);
            
        }
    }
    
    // MARK: IBAction
    @IBAction func showAllSeason(){
        print("");
    }
}

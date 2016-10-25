//
//  HorizontalListModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class HorizontalListModule: Module {
    
    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var labelModuleTitle : UILabel!;
    @IBOutlet weak var viewAll : UIView!;
    @IBOutlet weak var labelAll : UILabel!;
    @IBOutlet weak var imageViewNext : UIImageView!;
    @IBOutlet weak var scrollView : UIScrollView!;
    @IBOutlet weak var heightScrollViewConstraint : NSLayoutConstraint!;
    @IBOutlet weak var buttonAll : UIButton!;
    
    internal var itemWidth : CGFloat = 0;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    internal func setScrollItemConstraints(_ position: Int, item: UIView){
        item.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0));
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0));
        
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: itemWidth));
        
        
        
        let left : CGFloat = (CGFloat(position) * (itemWidth+10)) + 15;
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: scrollView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: left));
    }
    
    internal func layoutScrollView(_ width : CGFloat){
        self.scrollView.layoutSubviews();
        self.scrollView.contentSize = CGSize(width: width, height: self.heightScrollViewConstraint.constant);
    }
}

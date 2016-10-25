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
    
    
    internal func setScrollItemConstraints(position: Int, item: UIView){
        item.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0));
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0));
        
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: itemWidth));
        
        
        
        let left : CGFloat = (CGFloat(position) * (itemWidth+10)) + 15;
        scrollView.addConstraint(NSLayoutConstraint(item: item, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: left));
    }
    
    internal func layoutScrollView(width : CGFloat){
        self.scrollView.layoutSubviews();
        self.scrollView.contentSize = CGSizeMake(width, self.heightScrollViewConstraint.constant);
    }
}

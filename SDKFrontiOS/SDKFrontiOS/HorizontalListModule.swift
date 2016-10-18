//
//  HorizontalListModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/10/16.
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

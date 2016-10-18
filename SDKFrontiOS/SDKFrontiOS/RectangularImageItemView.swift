//
//  RectangularImageItemView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class RectangularImageItemView: UIView {
    
    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var viewTitleAndSubtitle : UIView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelSubtitle : UILabel!;

    override func awakeFromNib() {
        super.awakeFromNib();
    }

}

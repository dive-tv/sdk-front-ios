//
//  Header.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Header: UITableViewCell {

    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var viewContainer : UIView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelSubtitle : UILabel!;
    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var heightImageViewConstraint : NSLayoutConstraint!;
    @IBOutlet weak var buttonBuy : UIButton!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

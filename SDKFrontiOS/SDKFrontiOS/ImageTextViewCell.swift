//
//  ImageTextViewCell.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 19/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class ImageTextViewCell: UITableViewCell {

    @IBOutlet weak var viewContainer : UIView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelSubtitle : UILabel!;
    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var widthImageViewItemConstraint : NSLayoutConstraint!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

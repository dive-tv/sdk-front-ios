//
//  MovieHeader.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class MovieHeader: Module {

    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelProducer : UILabel!;
    @IBOutlet weak var labelGenre : UILabel!;
    @IBOutlet weak var labelTime : UILabel!;
    @IBOutlet weak var buttonDiveIn : UIButton!;
    @IBOutlet weak var imageViewSmall : UIImageView!;
    @IBOutlet weak var imageViewBig : UIImageView!;
    @IBOutlet weak var heightButtonDiveInConstraint : NSLayoutConstraint!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

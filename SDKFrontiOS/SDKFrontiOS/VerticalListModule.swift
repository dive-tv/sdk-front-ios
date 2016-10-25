//
//  VerticalListModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class VerticalListModule: Module {
    
    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var viewTitleModule : UIView!;
    @IBOutlet weak var labelTitleModule : UILabel!;
    @IBOutlet weak var heightViewTitleModuleConstraint : NSLayoutConstraint!;
    @IBOutlet weak var tableView : UITableView!;
    @IBOutlet weak var heightTableViewConstraint : NSLayoutConstraint!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

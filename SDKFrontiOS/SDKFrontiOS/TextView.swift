//
//  TextView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 20/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TextView: UIView {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var expandOpenBtn: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var disclamerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var disclaimerTitle: UILabel!
    @IBOutlet weak var disclaimerBtn: UIButton!
    @IBOutlet weak var disclaimerImage: UIImageView!
    @IBOutlet weak var disclaimerSubtitle: UILabel!
    
    @IBOutlet weak var leftDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var topDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var rightDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var bottomDistanceConstraint : NSLayoutConstraint!;

}

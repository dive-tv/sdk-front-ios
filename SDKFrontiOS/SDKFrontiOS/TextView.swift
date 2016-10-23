//
//  TextView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 20/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TextView: UIView {
    
    // TODO: need more constraints for all cases.
    @IBOutlet weak var heightDisclaimerBtnConstraint : NSLayoutConstraint!;
    @IBOutlet weak var heightDisclaimerImageConstraint : NSLayoutConstraint!;
    @IBOutlet weak var topDistanceDisclaimerTitleConstraint : NSLayoutConstraint!;
    @IBOutlet weak var topDistanceDisclaimerSubtitleConstraint : NSLayoutConstraint!;
    @IBOutlet weak var bottomDistanceDisclaimerSubtitleConstraint : NSLayoutConstraint!;
    @IBOutlet weak var heightSeparatorViewConstraint : NSLayoutConstraint!;

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var expandOpenBtn: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var disclaimerTitle: UILabel!
    @IBOutlet weak var disclaimerBtn: UIButton!
    @IBOutlet weak var disclaimerImage: UIImageView!
    @IBOutlet weak var disclaimerSubtitle: UILabel!
    
    @IBOutlet weak var leftDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var topDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var rightDistanceConstraint : NSLayoutConstraint!;
    @IBOutlet weak var bottomDistanceConstraint : NSLayoutConstraint!;

}

//
//  TextModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TextModule: Module {
    
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
    
    @IBOutlet weak var viewBackground : UIView!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: Internal Methods
    internal func setSource(source : Source?){
        if(source != nil){
            // TODO: need to put localizable
            self.disclaimerTitle.text = "Fuente:";
            self.disclaimerBtn.titleLabel?.text = source!.name;
            if(source?.url != nil){
                // TODO: change the color
                self.disclaimerBtn.enabled = true;
            }
            else{
                // TODO: change the color
                self.disclaimerBtn.enabled = false;
            }
            if(source?.image != nil){
                // TODO: download image
            }
            else{
                self.disclaimerImage.hidden = true;
                self.heightDisclaimerImageConstraint.constant = 0;
            }
            if(source?.disclaimer != nil){
                self.disclaimerSubtitle.text = source?.disclaimer;
            }
            else{
                self.disclaimerSubtitle.text = "";
                self.topDistanceDisclaimerSubtitleConstraint.constant = 0;
            }
            
        }
        else{
            self.disclaimerTitle.text = "";
            self.disclaimerBtn.hidden = true;
            self.disclaimerImage.hidden = true;
            self.disclaimerSubtitle.text = "";
            self.topDistanceDisclaimerTitleConstraint.constant = 0;
            self.topDistanceDisclaimerSubtitleConstraint.constant = 0;
            self.heightDisclaimerBtnConstraint.constant = 0;
            self.heightDisclaimerImageConstraint.constant = 0;
            self.bottomDistanceDisclaimerSubtitleConstraint.constant = 0;
            self.heightSeparatorViewConstraint.constant = 0;
        }
    }
    
}

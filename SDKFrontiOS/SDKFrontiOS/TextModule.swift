//
//  TextModule.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 12/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TextModule : Module{
    
    var textView : TextView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.textView = NSBundle.mainBundle().loadNibNamed("TextView", owner: self, options: nil)?[0] as? TextView;
        
        self.contentView.addSubview(self.textView!);
        self.textView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.textView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.textView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    // MARK: Internal Methods
    internal func setSource(source : Source?){
        if(source != nil){
            // TODO: need to put localizable
            self.textView?.disclaimerTitle.text = "Fuente:";
            self.textView?.disclaimerBtn.titleLabel?.text = source!.name;
            if(source?.url != nil){
                // TODO: change the color
                self.textView?.disclaimerBtn.enabled = true;
            }
            else{
                // TODO: change the color
                self.textView?.disclaimerBtn.enabled = false;
            }
            if(source?.image != nil){
                // TODO: download image
            }
            else{
                self.textView?.disclaimerImage.hidden = true;
                self.textView?.heightDisclaimerImageConstraint.constant = 0;
            }
            if(source?.disclaimer != nil){
                self.textView?.disclaimerSubtitle.text = source?.disclaimer;
            }
            else{
                self.textView?.disclaimerSubtitle.text = "";
                self.textView?.topDistanceDisclaimerSubtitleConstraint.constant = 0;
            }
            
        }
        else{
            self.textView?.disclaimerTitle.text = "";
            self.textView?.disclaimerBtn.hidden = true;
            self.textView?.disclaimerImage.hidden = true;
            self.textView?.disclaimerSubtitle.text = "";
            self.textView?.topDistanceDisclaimerTitleConstraint.constant = 0;
            self.textView?.topDistanceDisclaimerSubtitleConstraint.constant = 0;
            self.textView?.heightDisclaimerBtnConstraint.constant = 0;
            self.textView?.heightDisclaimerImageConstraint.constant = 0;
            self.textView?.bottomDistanceDisclaimerSubtitleConstraint.constant = 0;
            self.textView?.heightSeparatorViewConstraint.constant = 0;
        }
    }
}

//
//  NavigationModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class NavigationModule: Module {

    @IBOutlet weak var navigationBtn: UIButton!
    
    var navigationTarget : Target!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        if (self.configModule.targets != nil && !self.configModule.targets!.isEmpty &&
            self.configModule.targets!.first!.sectionId != nil && !self.configModule.targets!.first!.sectionId!.isEmpty &&
            self.configModule.targets!.first!.text != nil && !self.configModule.targets!.first!.text!.isEmpty) {
        
            self.navigationTarget = self.configModule.targets?.first!;
        }
        
        self.navigationBtn.setTitle(self.navigationTarget.text, for: UIControlState());
    }
    
    @IBAction func touchNavigationBtn(_ sender: UIButton) {
        
        self.cardDelegate?.newSection(self.navigationTarget.sectionId!)
    }
}

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

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func setCardDetailData(_configModule: ConfigModule, _cardDetailData: CardDetailData) {
        super.setCardDetailData(_configModule, _cardDetailData: _cardDetailData);
        if (self.configModule.targets != nil && !self.configModule.targets!.isEmpty &&
            self.configModule.targets!.first!.sectionId != nil && !self.configModule.targets!.first!.sectionId!.isEmpty &&
            self.configModule.targets!.first!.text != nil && !self.configModule.targets!.first!.text!.isEmpty) {
        
            self.navigationTarget = self.configModule.targets?.first!;
        }
        
        self.navigationBtn.setTitle(self.navigationTarget.text, forState: .Normal);
    }
    
    @IBAction func touchNavigationBtn(sender: UIButton) {
        
        self.cardDelegate?.newSection(self.navigationTarget.sectionId!)
    }
}

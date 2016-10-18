//
//  TextModule.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 12/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import UIKit

public class TextModule : Module{
    
    override class func validate(data: CardDetailData) throws {
        print("VALIDATE: TEXTMODULE");
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var expandOpenBtn: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var disclamerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var disclaimerTitle: UILabel!
    @IBOutlet weak var disclaimerBtn: UIButton!
    @IBOutlet weak var disclaimerImage: UIImageView!
    @IBOutlet weak var disclaimerSubtitle: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

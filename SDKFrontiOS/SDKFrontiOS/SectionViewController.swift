//
//  Section.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

public class SectionViewController : UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    private var configSection : ConfigSection!;
    private var cardData : CardData!;
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, _configSection : ConfigSection, _cardData : CardData) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.configSection = _configSection;
        self.cardData = _cardData;
    }
    
    public override func viewDidLoad() {
        
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
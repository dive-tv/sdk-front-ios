//
//  Section.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

class Section : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var configModules : [ConfigModule]!;
    private var cardData : CardData!;
    var delegate : cardDetailDelegate?;
    
    //MARK: INIT
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, _configModules : [ConfigModule], _cardData : CardData) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.configModules = _configModules;
        self.cardData = _cardData;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        
        // TEST LOGIC
        let opc = self.configModules.first;
        self.configModules.removeAll();
        self.configModules.append(opc!);
        //
        
        
        for module in self.configModules {
            self.tableView?.registerNib(UINib(nibName: module.moduleName!, bundle: nil), forCellReuseIdentifier: module.moduleName!);
        }
        
        self.delegate?.test();
    }
    
    //MARK: Private

    
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configModules.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(self.configModules[indexPath.row].moduleName!) as! Module
        cell.setCardData(self.cardData);
        return cell;
    }
    
}
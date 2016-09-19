//
//  Section.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

protocol SectionDelegate : class {
    func reloadTable ();
}

class Section : UIViewController, SectionDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var configModules : [ConfigModule]!;
    private var cardData : CardData!;
    var cardDelegate : CardDetailDelegate?;
    
    //MARK: INIT
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, _configModules : [ConfigModule], _cardData : CardData) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.configModules = _configModules;
        self.cardData = _cardData;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    deinit {
        print("Section destroid")
    }
    
    //MARK: UIViewController methods
    
    /**
     Configures tableView and register tableViewCells
     */
    override func viewDidLoad() {
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        for module in self.configModules {
            self.tableView?.registerNib(UINib(nibName: module.moduleName!, bundle: nil), forCellReuseIdentifier: module.moduleName!);
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        self.tableView.reloadData();
    }
    
    //MARK: Private

    //MARK: Section delegate
    
    func reloadTable() {
        self.tableView.reloadData();
    }
    
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configModules.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCellWithIdentifier(self.configModules[indexPath.row].moduleName!) as! Module;
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.sectionDelegate = self;
        cell.cardDelegate = self.cardDelegate;
        cell.setCardData(self.configModules[indexPath.row], _cardData: self.cardData);
        return cell;
    }
    
}
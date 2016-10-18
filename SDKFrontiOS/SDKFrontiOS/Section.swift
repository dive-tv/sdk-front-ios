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
    
    private var configSection : ConfigSection!;
    private var cardDetailData : CardDetailData!;
    var cardDelegate : CardDetailDelegate?;
    weak var tabModuleDelegate : TabModuleDelegate?;
    
    
    
    
    //MARK: INIT
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, _configSection : ConfigSection, _cardDetailData : CardDetailData) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.configSection = _configSection;
        self.cardDetailData = _cardDetailData;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    deinit {
        print("Section destroid ------->")
    }
    
    //MARK: UIViewController methods
    
    
    /**
     Configures tableView and register tableViewCells
     */
    override func viewDidLoad() {
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.separatorStyle = .None;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        for module in self.configSection.arrayModules {
            self.tableView?.registerNib(UINib(nibName: module.moduleName!, bundle: nil), forCellReuseIdentifier: module.moduleName!);
        }
    }
    
    
    
    //MARK: Private

    
    
    private func getScrollViewOffset (_offset : CGFloat) -> CGFloat {
        
        var offset = _offset;
        
        if (_offset != 0 && _offset + self.tableView.frame.height > self.tableView.contentSize.height) {
            offset -= abs(self.tableView.contentSize.height - (offset + self.tableView.frame.height));
        }
        
        return offset < 0.0 ? _offset : offset;
    }
    
    
    //MARK: Section delegate
    
    
    /**
     Reload tableview and calls tab menu to refresh if exists.
     */
    func reloadTable() {
        
        let offset = self.tableView.contentOffset.y;
        self.tableView.reloadData();
        self.tabModuleDelegate?.refreshScrollView();
        if (self.tabModuleDelegate == nil && self.tableView.contentSize.height > self.tableView.frame.height) {
            self.tableView.layoutIfNeeded();
            self.tableView.contentOffset.y = self.getScrollViewOffset(offset);
        }
    }
    
    
    
    // MARK: UITableViewDataSource
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configSection.arrayModules.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCellWithIdentifier(self.configSection.arrayModules[indexPath.row].moduleName!) as! Module;
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.sectionDelegate = self;
        cell.cardDelegate = self.cardDelegate;
        cell.setCardDetailData(self.configSection.arrayModules[indexPath.row], _cardDetailData: self.cardDetailData);
        return cell;
    }
    
}

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
    func reloadTableAndOffset ();
    func reloadTable();
}

class Section : UIViewController, SectionDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var configSection : ConfigSection!;
    fileprivate var cardDetail : CardDetail!;
    var cardDelegate : CardDetailDelegate?;
    weak var tabModuleDelegate : TabModuleDelegate?;
    
    
    
    
    //MARK: INIT
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, _configSection : ConfigSection, _cardDetail : CardDetail) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.configSection = _configSection;
        self.cardDetail = _cardDetail;
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
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero);
        self.tableView.separatorStyle = .none;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        //let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String;
        
        for module in self.configSection.arrayModules {
            /*let moduleClass = NSClassFromString(appName + "." + module.moduleName!) as! Module.Type
            self.tableView.registerClass(moduleClass.self, forCellReuseIdentifier: module.moduleName!);*/
            self.tableView?.register(UINib(nibName: module.moduleName!, bundle: nil), forCellReuseIdentifier: module.moduleName!);
        }
    }
    
    
    
    //MARK: Private

    
    
    fileprivate func getScrollViewOffset (_ _offset : CGFloat) -> CGFloat {
        
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
    func reloadTableAndOffset() {
        
        let offset = self.tableView.contentOffset.y;
        self.tableView.reloadData();
        self.tabModuleDelegate?.refreshScrollView();
        if (self.tabModuleDelegate == nil && self.tableView.contentSize.height > self.tableView.frame.height) {
            self.tableView.layoutIfNeeded();
            self.tableView.contentOffset.y = self.getScrollViewOffset(offset);
        }
    }
    
    func reloadTable() {
        self.tableView.reloadData();
    }
    
    
    // MARK: UITableViewDataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configSection.arrayModules.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.configSection.arrayModules[(indexPath as NSIndexPath).row].moduleName!) as! Module;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.sectionDelegate = self;
        cell.cardDelegate = self.cardDelegate;
        cell.setCardDetail(self.configSection.arrayModules[(indexPath as NSIndexPath).row], _cardDetail: self.cardDetail);
        return cell;
    }
    
}

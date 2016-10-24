//
//  VerticalListView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 20/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class VerticalListView: UIView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var viewTitleModule : UIView!;
    @IBOutlet weak var labelTitleModule : UILabel!;
    @IBOutlet weak var heightViewTitleModuleConstraint : NSLayoutConstraint!;
    @IBOutlet weak var tableView : UITableView!;
    @IBOutlet weak var heightTableViewConstraint : NSLayoutConstraint!;
    
    private var reuseIdentifier = "TwoColsCell";
    private var data = [ListingContainerData]();
    
    override func awakeFromNib() {
        super.awakeFromNib();
        self.tableView.registerNib(UINib(nibName: "TwoColsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier);
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
    }
    
    func setDataSpecs(specsData : [ListingContainerData]){
        
        self.data = specsData;
        
        self.tableView.reloadData();
        self.tableView.layoutIfNeeded();
        self.tableView.layoutSubviews();
        
        self.heightTableViewConstraint.constant = self.tableView.contentSize.height;
        
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TwoColsCell;
        cell.titleLabel.text = self.data[indexPath.row].text;
        cell.valueLabel.text = self.data[indexPath.row].value;
        return cell;
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(cell.respondsToSelector(Selector("setSeparatorInset:"))){
            cell.separatorInset = UIEdgeInsetsZero;
        }
        if(cell.respondsToSelector(Selector("setLayoutMargins:"))){
            cell.layoutMargins = UIEdgeInsetsZero;
        }
        
        self.tableView.layoutSubviews();
        self.tableView.layoutIfNeeded();
    }
    
}

/*extension UITableView {
    func reloadData(completion: ()->()) {
        UIView.animateWithDuration(0, animations: { self.reloadData() })
        { _ in completion() }
    }
}*/

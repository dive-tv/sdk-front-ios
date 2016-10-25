//
//  Specifications.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Specifications: TwoColsModule, UITableViewDelegate, UITableViewDataSource {

    private var data = [ListingContainerData]();
    private var cellIdentifier = "TwoColsCell";
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableView.registerNib(UINib(nibName: "TwoColsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier);
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Specs] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Specs]{
            self.labelTitleModule.text = "Especificaciones".uppercaseString;
            
            self.data = container.data as! [ListingContainerData];
            
            self.tableView.reloadData();
            self.tableView.layoutIfNeeded();
            self.tableView.layoutSubviews();
            
            self.heightTableViewConstraint.constant = self.tableView.contentSize.height;
        }
        
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TwoColsCell;
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

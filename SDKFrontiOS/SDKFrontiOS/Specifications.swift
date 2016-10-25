//
//  Specifications.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Specifications: TwoColsModule, UITableViewDelegate, UITableViewDataSource {

    fileprivate var data = [ListingContainerData]();
    fileprivate var cellIdentifier = "TwoColsCell";
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableView.register(UINib(nibName: "TwoColsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier);
        self.tableView.tableFooterView = UIView(frame: CGRect.zero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Specs] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Specs]{
            self.labelTitleModule.text = "Especificaciones".uppercased();
            
            self.data = container.data as! [ListingContainerData];
            
            self.tableView.reloadData();
            self.tableView.layoutIfNeeded();
            self.tableView.layoutSubviews();
            
            self.heightTableViewConstraint.constant = self.tableView.contentSize.height;
        }
        
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TwoColsCell;
        cell.titleLabel.text = self.data[(indexPath as NSIndexPath).row].text;
        cell.valueLabel.text = self.data[(indexPath as NSIndexPath).row].value;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(cell.responds(to: #selector(setter: UITableViewCell.separatorInset))){
            cell.separatorInset = UIEdgeInsets.zero;
        }
        if(cell.responds(to: #selector(setter: UIView.layoutMargins))){
            cell.layoutMargins = UIEdgeInsets.zero;
        }
        
        self.tableView.layoutSubviews();
        self.tableView.layoutIfNeeded();
    }
    
}

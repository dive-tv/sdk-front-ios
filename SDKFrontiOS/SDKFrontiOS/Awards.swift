//
//  Awards.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Awards: VerticalListModule, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var heightViewExpand : NSLayoutConstraint!;
    @IBOutlet weak var heightSeparator : NSLayoutConstraint!;
    @IBOutlet weak var imageViewMore : UIImageView!;
    
    fileprivate var data = [AwardsContainerData]();
    fileprivate var cellIdentifier = "NativeCell";
    
    fileprivate var showExpandButton = true;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.tableView.registerNib(UINib(nibName: "TwoColsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier);
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier);
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Awards] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Awards]{
            self.data = container.data as! [AwardsContainerData];
            
            
            if(self.showExpandButton){
                self.showExpandButton = self.data.count > 5;
            }
            
            if(self.showExpandButton){
                self.heightViewExpand.constant = 50;
                self.heightSeparator.constant = 1;
                self.imageViewMore.isHidden = false;
            }
            else{
                self.heightViewExpand.constant = 0;
                self.heightSeparator.constant = 0;
                self.imageViewMore.isHidden = true;
            }
            
            // TODO: need to put the localizable
            self.labelTitleModule.text = "Premios".uppercased();
            
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
        if(showExpandButton){
            return 5;
        }
        return self.data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier);
        }
        
        let awardContainerData = self.data[(indexPath as NSIndexPath).row];
        
        cell?.textLabel?.text = awardContainerData.title;
        cell?.textLabel?.font = UIFont(name: "Lato-Semibold", size: 15);
        cell?.textLabel?.textColor = UIColor(red: 49/255, green: 50/255, blue: 51/255, alpha: 1);
        
        var text = "";
        
        if(awardContainerData.nominee.count > 0){
            text = text + "\(awardContainerData.nominee.count) \(awardContainerData.nominee.count == 1 ? "Nominación" : "Nominaciones")";
        }
        
        if(awardContainerData.winner.count > 0){
            if(text.characters.count > 0){
                text = text + " / ";
            }
            text = text + "\(awardContainerData.winner.count) \(awardContainerData.winner.count == 1 ? "Premio" : "Premios")";
        }
        
        
        cell?.detailTextLabel?.text = text;
        cell?.detailTextLabel?.font = UIFont(name: "Lato-Regular", size: 13);
        cell?.detailTextLabel?.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1);
        
        let imageView = UIImageView(image: UIImage(named:"ico_next"), highlightedImage: nil);
        //imageView.tintColor = UIColor.diveSeafoamBlueColor();
        cell?.accessoryView = imageView;
        
        
        return cell!;
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
    
    // MARK: IBAction
    @IBAction func expand(){
        self.showExpandButton = false;
        self.sectionDelegate?.reloadTable();
    }
    
}

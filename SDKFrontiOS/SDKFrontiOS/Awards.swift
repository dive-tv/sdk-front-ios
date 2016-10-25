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
    
    private var data = [AwardsContainerData]();
    private var cellIdentifier = "NativeCell";
    
    private var showExpandButton = true;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.tableView.registerNib(UINib(nibName: "TwoColsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier);
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier);
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Awards] where container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
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
                self.imageViewMore.hidden = false;
            }
            else{
                self.heightViewExpand.constant = 0;
                self.heightSeparator.constant = 0;
                self.imageViewMore.hidden = true;
            }
            
            // TODO: need to put the localizable
            self.labelTitleModule.text = "Premios".uppercaseString;
            
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
        if(showExpandButton){
            return 5;
        }
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier);
        }
        
        let awardContainerData = self.data[indexPath.row];
        
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
    
    // MARK: IBAction
    @IBAction func expand(){
        self.showExpandButton = false;
        self.sectionDelegate?.reloadTable();
    }
    
}

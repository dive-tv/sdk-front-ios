//
//  Carousel.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
internal class Carousel: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var data = [[[String]]]();
    
    
    
    //MARK: INIT
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        
        //This is for testing
        for _ in 0..<3 {
            var opc = [[String]]();
            
            for _ in 0..<8 {
                var imageCells = [String]();
                
                for _ in 0..<Int(arc4random_uniform(3) + 1) {
                    imageCells.append("Image_\(arc4random_uniform(4) + 1)")
                }
                
                opc.append(imageCells);
            }
            
            self.data.append(opc);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: UIViewController functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.tableView.registerNib(UINib(nibName: "CarouselCell", bundle: nil), forCellReuseIdentifier: "carouselCell");
        self.tableView.separatorStyle = .None;
        self.tableView.sectionIndexBackgroundColor = UIColor.clearColor();
        self.tableView.sectionIndexTrackingBackgroundColor = UIColor.blackColor();
        self.tableView.sectionIndexColor = UIColor.whiteColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: UITableViewDataSource
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SCENE \(section + 1)";
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return ["1","2", "3"]
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("carouselCell")! as! CarouselCell;
        cell.setCarouselCell(self.data[indexPath.section][indexPath.row]);
        cell.selectionStyle = .None;
        return cell;
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor();
        cell.contentView.backgroundColor = UIColor.clearColor();
    }
}

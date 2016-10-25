//
//  VerticalListController.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 19/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class VerticalList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a cell by default
        self.tableView.tableFooterView = UIView();
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "nativeCell");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: TableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nativeCell", forIndexPath: indexPath);
        return cell;
    }

}

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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "nativeCell");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nativeCell", for: indexPath);
        return cell;
    }

}

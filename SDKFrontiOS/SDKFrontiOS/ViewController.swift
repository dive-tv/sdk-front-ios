//
//  ViewController.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 14/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = NSBundle.mainBundle().pathForResource("config1", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                let json = JSON(data: data);
                if(json != nil && json.error == nil){
                    CardDetailJson().loadDataConfig(json);
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


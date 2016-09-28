//
//  ViewController.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 14/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addCarousel(sender: UIButton) {
        
        let controller = Carousel(nibName: "Carousel", bundle: nil);
        self.navigationController?.pushViewController(controller, animated: true);
    }

}


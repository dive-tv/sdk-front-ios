//
//  Carousel.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
protocol CarouselTableViewDelegate : class {
    func addCellsToTableView (_cells : [CarouselCellData]);
    func startNewScene (_sceneId : Int);
}
internal class Carousel: UIViewController, UITableViewDelegate, UITableViewDataSource, CarouselTableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sectionsToast: UIView!
    @IBOutlet weak var sectionToastText: UILabel!
    
    private var data = [[CarouselCellData]]();
    private var sceneManager : SceneManager!;
    weak var sceneManagerDelegate : CarouselCardDelegate?;
    
    
    
    //MARK: INIT
    
    /**
     The carousel create SceneManager to manage the scenes, pre-loads and cards that need to be shown in the carousel
     
     - parameter _delegate:      A delegate for the scene manager to lisen the events of the film.
     */
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, inout _delegate : CarouselCardDelegate?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.sceneManager = SceneManager();
        self.sceneManager.carouselTableViewDelegate = self;
        _delegate = self.sceneManager;
    }
    
    deinit {
        print("CAROUSEL DEINIT")
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
        
        self.sectionsToast.hidden = true;
        self.sectionToastText.text = "0";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: CarouselTableViewDelegate
    
    
    /**
     This is called when new cells has to be added to the tableView
     
     - parameter _cells: The data for the cell, with the number of the scene and the data for the cards shown inside the cell
     */
    func addCellsToTableView(_cells: [CarouselCellData]) {
        
        if (!self.data.isEmpty && self.data.count > _cells.first!.sceneId) {
            
            let section = abs((self.data.count - 1) - _cells.first!.sceneId);

            for cell in _cells {
                
                self.data[section].insert(cell, atIndex: 0);
            }
            
            self.tableView.reloadSections(NSIndexSet(index: section) , withRowAnimation: .Bottom);
            
        } else {
            
            self.data.insert([CarouselCellData](), atIndex: 0);
            self.tableView.reloadData();
            
            self.addCellsToTableView(_cells);
        }
    }
    
    
    /**
     This is called when a new section has to be added to the tableView
     
     - parameter _sceneId: the identificator of the new scene/section
     */
    func startNewScene(_sceneId: Int) {
        
        self.data.insert([CarouselCellData](), atIndex: 0);
        self.tableView.reloadData();
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
        return "SCENE \(self.data.count - section)";
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        var indexArray = [String]();
        for idx in (0..<self.data.count).reverse() {
            indexArray.append("\(idx + 1)");
        }
        return indexArray;
    }
    
    /*func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        self.sectionsToast.hidden = false;
        self.sectionToastText.text = title;
        return index;
    }*/

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

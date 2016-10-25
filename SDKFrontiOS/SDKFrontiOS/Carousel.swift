//
//  Carousel.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
protocol CarouselTableViewDelegate : class {
    func addCellsToTableView (_ _cells : [CarouselCellData]);
    func startNewScene (_ _sceneId : Int);
}
internal class Carousel: UIViewController, UITableViewDelegate, UITableViewDataSource, CarouselTableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sectionsToast: UIView!
    @IBOutlet weak var sectionToastText: UILabel!
    
    fileprivate var data = [[CarouselCellData]]();
    fileprivate var sceneManager : SceneManager!;
    weak var sceneManagerDelegate : CarouselCardDelegate?;
    
    
    
    //MARK: INIT
    
    /**
     The carousel create SceneManager to manage the scenes, pre-loads and cards that need to be shown in the carousel
     
     - parameter _delegate:      A delegate for the scene manager to lisen the events of the film.
     */
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, _delegate : inout CarouselCardDelegate?) {
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
        
        self.tableView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellReuseIdentifier: "carouselCell");
        self.tableView.separatorStyle = .none;
        self.tableView.sectionIndexBackgroundColor = UIColor.clear;
        self.tableView.sectionIndexTrackingBackgroundColor = UIColor.black;
        self.tableView.sectionIndexColor = UIColor.white;
        
        self.sectionsToast.isHidden = true;
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
    func addCellsToTableView(_ _cells: [CarouselCellData]) {
        
        if (!self.data.isEmpty && self.data.count > _cells.first!.sceneId) {
            
            let section = abs((self.data.count - 1) - _cells.first!.sceneId);

            for cell in _cells {
                
                self.data[section].insert(cell, at: 0);
            }
            
            self.tableView.reloadSections(IndexSet(integer: section) , with: .bottom);
            
        } else {
            
            self.data.insert([CarouselCellData](), at: 0);
            self.tableView.reloadData();
            
            self.addCellsToTableView(_cells);
        }
    }
    
    
    /**
     This is called when a new section has to be added to the tableView
     
     - parameter _sceneId: the identificator of the new scene/section
     */
    func startNewScene(_ _sceneId: Int) {
        
        self.data.insert([CarouselCellData](), at: 0);
        self.tableView.reloadData();
    }
    
    
    
    //MARK: UITableViewDataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SCENE \(self.data.count - section)";
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        var indexArray = [String]();
        for idx in (0..<self.data.count).reversed() {
            indexArray.append("\(idx + 1)");
        }
        return indexArray;
    }
    
    /*func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        self.sectionsToast.hidden = false;
        self.sectionToastText.text = title;
        return index;
    }*/

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "carouselCell")! as! CarouselCell;
        cell.setCarouselCell(self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]);
        cell.selectionStyle = .none;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear;
        cell.contentView.backgroundColor = UIColor.clear;
    }
}

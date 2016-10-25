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

    @IBOutlet weak var addCardBtn: UIButton!
    @IBOutlet weak var carouselContainer: UIView!
    var carouselDelegate : CarouselCardDelegate?;
    var timer : Timer?;
    var actualSection = -1;
    
    var batchCards = [CarouselCard]();
    var readycards = [CarouselCard]();
    
    var carousel : Carousel?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.parseJson();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func createCardDetail(_ sender: UIButton) {
    
        if let path = Bundle.main.path(forResource: "config2", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let json = JSON(data: data);
                if(json != nil && json.error == nil){
                    let cardDetailJSON = CardDetailJson(styleConfig: nil);
                    cardDetailJSON.loadDataConfig(json).build("", navigationController: self.navigationController!);
                }
            }
        }
    }
    
    @IBAction func addCarousel(_ sender: UIButton) {
        
        if self.carousel != nil {
            
            sender.setTitle("Create carousel", for: UIControlState());
            
            self.addCardBtn.setTitle("+", for: UIControlState());
            self.carouselDelegate = nil;
            self.timer?.invalidate();
            self.timer = nil;
            self.actualSection = -1;
            
            self.batchCards.removeAll();
            self.readycards.removeAll();
            
            self.carousel?.removeFromParentViewController();
            self.carousel?.view.removeFromSuperview();
            self.carousel = nil;
            
            self.parseJson();
            
        } else {
            
            sender.setTitle("Destroy carousel", for: UIControlState());
            
            self.carousel = Carousel(nibName: "Carousel", bundle: nil, _delegate: &self.carouselDelegate);
            
            //self.navigationController?.pushViewController(controller, animated: true);
            
            let top = NSLayoutConstraint(item: self.carousel!.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: self.carousel!.view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0);
            
            let left = NSLayoutConstraint(item: self.carousel!.view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0);
            
            let right = NSLayoutConstraint(item: self.carousel!.view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
            
            self.carousel!.view.translatesAutoresizingMaskIntoConstraints = false;
            
            self.addChildViewController(self.carousel!);
            self.carouselContainer.addSubview(self.carousel!.view);
            self.carouselContainer.addConstraints([top, bottom, left, right]);
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        }
        
        
    }
    
    @IBAction func addCards(_ sender: UIButton) {
        
        if (!self.readycards.isEmpty) {
            
            var numberOfCards = Int(arc4random_uniform(5) + 1);
            
            if numberOfCards>=self.readycards.count {
                numberOfCards = self.readycards.count;
            }
            
            var pushCards = [String]();
            let lastSceneId = self.readycards.last!.scene_id;
            
            for idx in ((self.readycards.count - numberOfCards)..<self.readycards.count).reversed() {
                
                if lastSceneId == self.readycards[idx].scene_id {
                    pushCards.append(self.readycards[idx].data!.cardId);
                    self.readycards.removeLast();
                }
            }
            
            self.carouselDelegate?.onCardsForPaintReceived!(pushCards);
            
            self.addCardBtn.setTitle("\(self.readycards.count) +", for: UIControlState())
        } else {
            
            self.timer?.invalidate();
            self.timer = nil;
        }
        
    }

    @IBAction func newSection(_ sender: UIButton) {
        self.actualSection += 1;
        self.carouselDelegate?.onSectionStartReceived!(self.actualSection);
    }
    
    
    func update () {
        
        if (!self.batchCards.isEmpty) {
            var numberOfCards = Int(arc4random_uniform(5) + 1);
            
            if numberOfCards>=self.batchCards.count {
                numberOfCards = self.batchCards.count;
            }
            
            var preloadArray = [CarouselCard]();
            
            for idx in ((self.batchCards.count - numberOfCards)..<self.batchCards.count).reversed() {
                
                preloadArray.append(self.batchCards[idx]);
                self.readycards.insert(self.batchCards[idx], at: 0);
                self.batchCards.removeLast();
            }
            
            self.carouselDelegate?.onCardsForPreloadReceived!(preloadArray);
            self.addCardBtn.setTitle("\(self.readycards.count) +", for: UIControlState())
            
            
        } else {
            
            self.timer?.invalidate();
            self.timer = nil;
        }
        
    }
    
    fileprivate func parseJson () {
        
        let jsonFilePath:String = Bundle.main.path(forResource: "cards", ofType: "json")! as String
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) {
            let json = JSON(data: data);
        }
        /*let jsonData:Data = Data.dataWithContentsOfMappedFile(jsonFilePath as String) as! Data;
        let json = JSON(data: jsonData);*/
        
        // TODO: need to do the logic
        /*for card in json {
            
            let miniCardData = MiniCard(_cardId: card.1["card_id"].stringValue, _title: card.1["title"].stringValue, _type: TypeOfCard(rawValue: card.1["type"].stringValue)!, _image : card.1["image"].stringValue);
            let carouselCard = CarouselCard(_scene_id: Int(self.batchCards.count / 5) , _data: miniCardData);
            self.batchCards.insert(carouselCard, atIndex: 0);
            //self.batchCards.append(carouselCard);
        }*/
        
        
    }
}


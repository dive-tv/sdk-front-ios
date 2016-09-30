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
    var timer : NSTimer?;
    var actualSection = -1;
    
    var batchCards = [CarouselCard]();
    var readycards = [CarouselCard]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.parseJson();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func addCarousel(sender: UIButton) {
        
        let controller = Carousel(nibName: "Carousel", bundle: nil, _delegate: &self.carouselDelegate);
        
        //self.navigationController?.pushViewController(controller, animated: true);
        
        let top = NSLayoutConstraint(item: controller.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0);
        
        let bottom = NSLayoutConstraint(item: controller.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0);
        
        let left = NSLayoutConstraint(item: controller.view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0);
        
        let right = NSLayoutConstraint(item: controller.view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.carouselContainer, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
        
        controller.view.translatesAutoresizingMaskIntoConstraints = false;
        
        self.addChildViewController(controller);
        self.carouselContainer.addSubview(controller.view);
        self.carouselContainer.addConstraints([top, bottom, left, right]);
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    @IBAction func addCards(sender: UIButton) {
        
        if (!self.readycards.isEmpty) {
            
            var numberOfCards = Int(arc4random_uniform(5) + 1);
            
            if numberOfCards>=self.readycards.count {
                numberOfCards = self.readycards.count;
            }
            
            var pushCards = [String]();
            let lastSceneId = self.readycards.last!.scene_id;
            
            for idx in ((self.readycards.count - numberOfCards)..<self.readycards.count).reverse() {
                
                if lastSceneId == self.readycards[idx].scene_id {
                    pushCards.append(self.readycards[idx].data!.cardId);
                    self.readycards.removeLast();
                }
            }
            
            self.carouselDelegate?.onCardsForPaintReceived!(pushCards);
            
            self.addCardBtn.setTitle("\(self.readycards.count) +", forState: .Normal)
        } else {
            
            self.timer?.invalidate();
        }
        
    }

    @IBAction func newSection(sender: UIButton) {
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
            
            for idx in ((self.batchCards.count - numberOfCards)..<self.batchCards.count).reverse() {
                
                preloadArray.append(self.batchCards[idx]);
                self.readycards.insert(self.batchCards[idx], atIndex: 0);
                self.batchCards.removeLast();
            }
            
            self.carouselDelegate?.onCardsForPreloadReceived!(preloadArray);
            self.addCardBtn.setTitle("\(self.readycards.count) +", forState: .Normal)
            
            
        } else {
            
            self.timer?.invalidate();
        }
        
    }
    
    private func parseJson () {
        
        let jsonFilePath:NSString = NSBundle.mainBundle().pathForResource("cards", ofType: "json")!
        let jsonData:NSData = NSData.dataWithContentsOfMappedFile(jsonFilePath as String) as! NSData;
        let json = JSON(data: jsonData);
        
        for card in json {
            
            let cardData = CardData(_cardId: card.1["card_id"].stringValue, _title: card.1["title"].stringValue, _type: TypeOfCard(rawValue: card.1["type"].stringValue)!, _image : card.1["image"].stringValue);
            let carouselCard = CarouselCard(_scene_id: Int(self.batchCards.count / 5) , _data: cardData);
            self.batchCards.insert(carouselCard, atIndex: 0);
            //self.batchCards.append(carouselCard);
        }
        
        
    }
}


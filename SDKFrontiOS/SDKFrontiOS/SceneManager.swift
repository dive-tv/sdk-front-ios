//
//  ScenesManager.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

@objc public protocol CarouselCardDelegate : class {
    @objc optional func onCardsForPreloadReceived (_ _cards : [CarouselCard]);
    @objc optional func onCardsForPaintReceived (_ _cards : [String]);
    @objc optional func onSectionStartReceived (_ _sectionId : Int);
    //optional func onCarouselSceneChanged (sceneId : Int);
}


internal class SceneManager : NSObject, CarouselCardDelegate {
    
    fileprivate var cards = [String : CarouselCard]();
    fileprivate var cardsByScene = [Int : [CarouselCard]]();
    fileprivate var carruselLogic : CarouselLogic!;
    
    weak var carouselTableViewDelegate : CarouselTableViewDelegate?;
    
    override init() {
        super.init();
        
        self.carruselLogic = CarouselLogic();
    }
    
    deinit {
        print("SCENE MANAGER DEINIT")
    }

    
    
    
    //MARK : CarouselCardDelegate
    
    
    /**
     This is called when a new scene starts. A new section is created in the tableView
     
     - parameter _sectionId: the scene number
     */
    func onSectionStartReceived(_ _sectionId: Int) {
        print("Carousel Manager --------> start section \(_sectionId)");
        
        self.carouselTableViewDelegate?.startNewScene(_sectionId);
    }
    
    
    /**
     This is called when new cards images has to been downloaded
     
     - parameter _cards: the data of the cards to be pre-charged
     */
    func onCardsForPreloadReceived(_ _cards: [CarouselCard]) {
        
        print("Carousel Manager --------> cards to preload \(_cards.count)");
        
        for card in _cards {
            
            if (self.cards[card.data.cardId] == nil) {
                self.cards[card.data.cardId] = card;
            }
        }
        
        // download images for preload
    }
    
    
    /**
     This is called when new cards has to been shown in the tableView
     
     - parameter _cards: <#_cards description#>
     */
    func onCardsForPaintReceived(_ _cards: [String]) {
        print("Carousel Manager --------> cards to push \(_cards)");
        
        // Call to logic
        
        //This is for testing
        var carouselCells = [CarouselCellData]();
        
        for card in _cards {
            
            if (self.cards[card] != nil) {
                let carouselCard = self.cards[card]!;
                let cellData = CarouselCellData(_sceneId: carouselCard.scene_id, _cards: [carouselCard]);
                carouselCells.append(cellData);
            }
        }
        
        self.carouselTableViewDelegate?.addCellsToTableView(carouselCells);
    }
    
    //MARK: internal methods
    
    func onCarouselSceneChanged (_ sceneId : Int) {
        //Need to do the logic
    }
    
}

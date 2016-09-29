//
//  ScenesManager.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

@objc public protocol CarouselCardDelegate : class {
    optional func onCardsForPreloadReceived (_cards : [CarouselCard]);
    optional func onCardsForPaintReceived (_cards : [String]);
    optional func onSectionStartReceived (_sectionId : Int);
    //optional func onCarouselSceneChanged (sceneId : Int);
}


internal class SceneManager : NSObject, CarouselCardDelegate {
    
    private var cards = [String : CarouselCard]();
    private var cardsByScene = [Int : [CarouselCard]]();
    private var carruselLogic : CarouselLogic!;
    private var actualSection = 0;
    
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
     
     - parameter _sectionId: <#_sectionId description#>
     */
    func onSectionStartReceived(_sectionId: Int) {
        print("Carousel Manager --------> start section \(_sectionId)");
        
        self.actualSection = _sectionId;
        
        self.carouselTableViewDelegate?.startNewScene(self.actualSection);
    }
    
    
    /**
     This is called when new cards images has to been downloaded
     
     - parameter _cards: the data of the cards to be pre-charged
     */
    func onCardsForPreloadReceived(_cards: [CarouselCard]) {
        
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
    func onCardsForPaintReceived(_cards: [String]) {
        print("Carousel Manager --------> cards to push \(_cards)");
        
        // Call to logic
        
        //This is for testing
        var carouselCells = [CarouselCellData]();
        
        for card in _cards {
            
            if (self.cards[card] != nil) {
                let carouselCard = self.cards[card]!;
                let cellData = CarouselCellData(_sceneId: self.actualSection, _cards: [carouselCard]);
                carouselCells.append(cellData);
            }
        }
        
        self.carouselTableViewDelegate?.addCellsToTableView(carouselCells);
    }
    
    //MARK: internal methods
    
    func onCarouselSceneChanged (sceneId : Int) {
        //Need to do the logic
    }
    
}
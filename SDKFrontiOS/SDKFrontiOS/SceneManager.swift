//
//  ScenesManager.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

@objc public protocol CarouselCardDelegate {
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
    
    override init() {
        super.init();
        
        self.carruselLogic = CarouselLogic();
    }
    
    deinit {
        print("SCENE MANAGER DEINIT")
    }

    
    
    
    //MARK : CarouselCardDelegate
    
    
    func onSectionStartReceived(_sectionId: Int) {
        print("Carousel Manager --------> start section \(_sectionId)");
        
        self.actualSection = _sectionId;
    }
    
    func onCardsForPreloadReceived(_cards: [CarouselCard]) {
        
        print("Carousel Manager --------> cards to preload \(_cards.count)");
        
        for card in _cards {
            
            if (self.cards[card.data.cardId] == nil) {
                self.cards[card.data.cardId] = card;
            }
        }
        
        // download images for preload
    }
    
    func onCardsForPaintReceived(_cards: [String]) {
        print("Carousel Manager --------> cards to push \(_cards)");
        
        // call carousel for index cards in tableview
    }
    
    //MARK: internal methods
    
    func onCarouselSceneChanged (sceneId : Int) {
        
    }
    
}
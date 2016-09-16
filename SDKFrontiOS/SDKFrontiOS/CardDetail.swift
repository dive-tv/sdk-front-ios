//
//  CardDetail.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

protocol cardDetailDelegate {
    func test();
}

public class CardDetail : NSObject, cardDetailDelegate{
    
    private var sectionsData : [String:ConfigSection]!;
    private var navigationController : UINavigationController!;
    private var mainSectionKey : String!;
    private var cardData : CardData!;
    
    init(_sectionsData : [String:ConfigSection], _mainSectionKey : String!, _cardData : CardData, _navigationController : UINavigationController) {
        super.init();
        
        self.sectionsData = _sectionsData;
        self.navigationController = _navigationController;
        self.mainSectionKey = _mainSectionKey;
        self.cardData = _cardData;
        
        self.pushMain();
    }

    deinit {
        print("CardDetail Destroid")
    }

    
    private func pushMain() {
        
        if (self.sectionsData[self.mainSectionKey] != nil) {
            let controller = Section(nibName: "Section", bundle: nil, _configModules: self.sectionsData[self.mainSectionKey]!.arrayModules, _cardData: self.cardData);
            controller.delegate = self;
            self.navigationController.pushViewController(controller, animated: true);
        }
    }
    
    private func pushSection (_keyForSection : String) {
        
        if (self.sectionsData[_keyForSection] != nil) {
            let controller = Section(nibName: "Section", bundle: nil, _configModules: self.sectionsData[_keyForSection]!.arrayModules, _cardData: self.cardData);
            self.navigationController.pushViewController(controller, animated: true);
        }
    }
    
    func test() {
        print("test")
    }
    
}
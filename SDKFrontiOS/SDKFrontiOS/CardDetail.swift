//
//  CardDetail.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

public class CardDetail : NSObject{
    
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
    }
    
    private func pushMain() {
        
        if (self.sectionsData[self.mainSectionKey] != nil) {
            let controller = SectionViewController(nibName: "SectionViewController", bundle: nil, _configSection: self.sectionsData[self.mainSectionKey]!, _cardData: self.cardData);
            self.navigationController.pushViewController(controller, animated: true);
        }
        
    }
    
    private func pushSection (_keyForSection : String) {
        
        if (self.sectionsData[_keyForSection] != nil) {
            let controller = SectionViewController(nibName: "SectionViewController", bundle: nil, _configSection: self.sectionsData[_keyForSection]!, _cardData: self.cardData);
            self.navigationController.pushViewController(controller, animated: true);
        }
    }
}
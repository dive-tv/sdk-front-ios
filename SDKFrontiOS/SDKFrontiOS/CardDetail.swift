//
//  CardDetail.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit

protocol CardDetailDelegate : class {
    func createSection (_keyForSection : String) -> Section
    func createSections (_keyForSections : [String]) -> [Section]
    func newSection(_keyForSection : String);
}

public class CardDetail : NSObject, CardDetailDelegate{
    
    private var sectionsData : [String:ConfigSection]!;
    private var navigationController : UINavigationController!;
    private var mainSectionKey : String!;
    private var cardData : CardData!;
    
    //MARK: INIT
    
    init(_sectionsData : [String:ConfigSection], _mainSectionKey : String!, _cardData : CardData, _navigationController : UINavigationController) {
        super.init();
        
        self.sectionsData = _sectionsData;
        self.navigationController = _navigationController;
        self.mainSectionKey = _mainSectionKey;
        self.cardData = _cardData;
        
        self.pushMain();
    }

    deinit {
        print("CardDetail destroid")
    }
    
    //MARK: Private methods

    /**
     Pushes to the clients UINavigationViewController the main section especified by the client
     */
    private func pushMain() {
        
        if (self.sectionsData[self.mainSectionKey] != nil) {
            
            let controller = self.createSection(self.mainSectionKey);
            controller.cardDelegate = self;
            self.navigationController.pushViewController(controller, animated: true);
        }
    }
    
    /**
     Pushes to the clients UINavigationViewController the selected section especified by the client
     
     - parameter _keyForSection: the key string of teh section
     */
    private func pushSection (_keyForSection : String) {
        
        if (self.mainSectionKey != _keyForSection && self.sectionsData[_keyForSection] != nil) {
            
            let controller = self.createSection(_keyForSection);
            controller.cardDelegate = self;
            self.navigationController.pushViewController(controller, animated: true);
        }
    }
    
    
    //MARK: Card detail delegate
    
    func createSection (_keyForSection : String) -> Section {
        
        return Section(nibName: "Section", bundle: nil, _configModules: self.sectionsData[_keyForSection]!.arrayModules, _cardData: self.cardData);
    }
    
    func createSections (_keyForSections : [String]) -> [Section] {
        
        var sections = [Section]()
        
        for key in _keyForSections {
            
            sections.append(Section(nibName: "Section", bundle: nil, _configModules: self.sectionsData[key]!.arrayModules, _cardData: self.cardData));
            
        }
        
        return sections;
    }
    
    func newSection(_keyForSection: String) {
        self.pushSection(_keyForSection);
    }
    
}
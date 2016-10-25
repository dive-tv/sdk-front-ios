//
//  BaseCardDetailBuilder.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


private typealias completionBlockGetCard = (CardDetail)->Void;

open class BaseCardDetailBuilder : NSObject{
    
    internal var styleConfig : JSON?;
    internal var dictSections = [String : ConfigSection]();
    internal var mainKeySection : String?;
    
    fileprivate var moduleValidator : ModuleValidator!;
    
    // MARK: Init
    /**
     The initializer.
     
     - parameter styleConfig: This is optional, by default is nil. If the user wants a style for the CardDetail need to pass a json.
     
     - parameter customValidator: This is optional, by default is nil. If the user wants a custom module for the CardDetail need to pass a json with the kind of the module he wants and the information that module needs.
     
     - returns: self
     */
    init(styleConfig : JSON? = nil){
        super.init();
        self.styleConfig = styleConfig;
        self.moduleValidator = ModuleValidator();
    }
    
    // MARK: Public Methods
    /**
     This method build a CardDetail with the modules and sections the user wants to show.
     When finished build the CardDetail this is added to the navigation controller.
     
     - parameter cardId:   The cardId to get the information of the card
     - parameter navigationController: The navigation controller of the user.
     */
    open func build(_ cardId : String, navigationController : UINavigationController){
        self.getCardDetail(cardId) { (cardData : CardDetail) in
            
            self.validateSectionsAndModules(cardData);
            
            var validSections = [String : ConfigSection]();
            for key in self.dictSections.keys{
                let configSection = self.dictSections[key]!;
                if(configSection.isValidSection){
                    let newConfigSection = self.createConfigSection(configSection.arrayModules);
                    if(newConfigSection.arrayModules.count > 0){
                        validSections[key] = newConfigSection;
                    }
                }
            }
            
            // TODO: need to do the logic
            CardDetailRender(_sectionsData: validSections, _mainSectionKey: self.mainKeySection!, _cardDetail: cardData, _navigationController: navigationController);
        }
    }
    
    // MARK: Private Methods
    /**
     This method call the SDKClient.
     
     - parameter cardId:          The cardId to get the information of the card
     - parameter completionBlock: The completion with the CardData.
     */
    fileprivate func getCardDetail(_ cardId : String, completionBlock : completionBlockGetCard){
        // TODO: need to call the sdkclient and in the response call the completion
        // For test we catch a local json
        if let path = Bundle.main.path(forResource: "card_detail_example", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let json = JSON(data: data);
                if(json != nil && json.error == nil){
                    completionBlock(CardDetail(data: json));
                }
            }
        }
        //completionBlock(CardDetail(_cardId : "ID", _type : "person", _locale : "ES_es", _title : "Title"));
    }
    
    /**
     This method validate sections and modules.
     
     - parameter cardData: The data with all the info
     */
    fileprivate func validateSectionsAndModules(_ cardData : CardDetail){
        for key in self.dictSections.keys{
            let configSection = self.dictSections[key]!;
            for configModule in configSection.arrayModules{
                if(configModule.targets == nil){
                    if(self.moduleValidator.validate(cardData, moduleType: configModule.moduleName!)){
                        configModule.isValid = true;
                        if(!configSection.isValidSection){
                            configSection.isValidSection = true;
                        }
                    }
                }
            }
        }
    }
    
    /**
     This method create a new ConfigSection with valid modules.
     
     - parameter arrayModules: The array of modules
     
     - returns: Return a ConfigSection
     */
    fileprivate func createConfigSection(_ arrayModules : [ConfigModule])->ConfigSection{
        // Create a new ConfigSection
        let newConfigSection = ConfigSection();
        for configModule in arrayModules{
            // Check if is a normal module
            if(configModule.targets == nil){
                // Check if is valid and add to the new ConfigSection
                if(configModule.isValid){
                    newConfigSection.addModule(configModule.moduleName!, targets: configModule.targets);
                }
            }
            else{
                var newTargets = [Target]();
                for target in configModule.targets!{
                    // Check if the target is valid and add to the array
                    if(target.sectionId != nil && self.dictSections[target.sectionId!] != nil && self.dictSections[target.sectionId!]!.isValidSection){
                        newTargets.append(target);
                    }
                }
                // Only add the module if we have more than one target
                if(newTargets.count > 0){
                    newConfigSection.addModule(configModule.moduleName!, targets: newTargets);
                }
                
            }
        }
        return newConfigSection;
    }
    
    

}

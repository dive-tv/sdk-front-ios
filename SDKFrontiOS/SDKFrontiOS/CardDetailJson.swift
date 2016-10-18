//
//  CardDetailJson.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CardDetailJson : BaseCardDetailBuilder{
    
    // MARK: Init
    /**
     The initializer.
     
     - parameter styleConfig: This is optional, by default is nil. If the user wants a style for the CardDetail need to pass a json.
     
     - parameter customValidator: This is optional, by default is nil. If the user wants a custom module for the CardDetail need to pass a json with the kind of the module he wants and the information that module needs.
     
     - returns: self
     */
    override init( styleConfig : JSON? = nil, customValidator : JSON? = nil) {
        super.init(styleConfig: styleConfig, customValidator : customValidator);
    }
    
    // MARK: Public Methods
    /**
     This method receive a json configured by the user.
     
     - parameter json: The json with the sections and modules the user wants to show
     
     - returns: Returns the CardDetailJson
     */
    public func loadDataConfig(json : JSON) -> CardDetailJson{
        
        
        for section in json["sections"].arrayValue{
            let configSection = ConfigSection();
            for module in section["modules"].arrayValue{
                self.addModuleType(module, configSection: configSection);
            }
            // This check if already exist the section, if exist don't do nothing
            if(self.dictSections[section["title"].stringValue] == nil){
                self.dictSections[section["title"].stringValue] = configSection;
            }
            // This is to get the main key
            if(section["main"] != nil && section["main"].boolValue && self.mainKeySection == nil){
                self.mainKeySection = section["title"].stringValue;
            }
        }
        return self;
    }
    
    // MARK: Private Methods
    
    /**
     This method check the type of module the user wants and add to ConfigSection.
     
     - parameter module:        The json with the type of module the user wants.
     - parameter configSection: The object ConfigSection to add the modules.
     */
    private func addModuleType(module : JSON, configSection : ConfigSection){
        if(module["type"] != nil){
            let moduleName = module["type"].stringValue;
            if  let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String {
                if(NSClassFromString("\(appName).\(moduleName)") as? NSObject.Type != nil){
                    var targets : [Target]?;
                    if (moduleName == "NavigationModule" || moduleName == "TabModule") {
                        for target in module["targets"].arrayValue{
                            if(targets == nil){
                                targets = [Target]();
                            }
                            if(target["section_id"] != nil && target["text"] != nil){
                                let _target = Target(sectionId: target["section_id"].stringValue, text: target["text"].stringValue);
                                targets?.append(_target);
                            }
                        }
                    }
                    configSection.addModule(moduleName, targets: targets);
                }
            }
        }
    }
}
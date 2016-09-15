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
     
     - returns: self
     */
    override init( styleConfig : JSON? = nil) {
        super.init(styleConfig: styleConfig);
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
            if(section["main"] != nil && section["main"].boolValue && self.keyMain == nil){
                self.keyMain = section["title"].stringValue;
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
        
        switch module["type"].string!{
        case JsonDatType.Actor.rawValue:
            configSection.addModule(ModuleType.Actor);
            break;
        case JsonDatType.Director.rawValue:
            configSection.addModule(ModuleType.Director);
            break;
        case JsonDatType.Title.rawValue:
            configSection.addModule(ModuleType.Title);
            break;
        case JsonDatType.Trailer.rawValue:
            configSection.addModule(ModuleType.Trailer);
            break;
        case JsonDatType.Image.rawValue:
            configSection.addModule(ModuleType.Image);
            break;
        case JsonDatType.Synopsis.rawValue:
            configSection.addModule(ModuleType.Synopsis);
            break;
        case JsonDatType.Gallery.rawValue:
            configSection.addModule(ModuleType.Gallery);
            break;
        case JsonDatType.Rating.rawValue:
            configSection.addModule(ModuleType.Rating);
            break;
        case JsonDatType.Video.rawValue:
            configSection.addModule(ModuleType.Video);
            break;
        case JsonDatType.Relation.rawValue:
            configSection.addModule(ModuleType.Relation);
            break;
        case JsonDatType.Award.rawValue:
            configSection.addModule(ModuleType.Award);
            break;
        case JsonDatType.Product.rawValue:
            configSection.addModule(ModuleType.Product);
            break;
        case JsonDatType.Navigation.rawValue:
            var targets : [Target]?;
            
            for target in module["targets"].arrayValue{
                if(targets == nil){
                    targets = [Target]();
                }
                if(target["section_id"] != nil && target["text"] != nil){
                    let _target = Target(sectionId: target["section_id"].stringValue, text: target["text"].stringValue);
                    targets?.append(_target);
                }
            }
            configSection.addModule(ModuleType.Navigation, targets: targets);
            break;
        case JsonDatType.Tab.rawValue:
            var targets : [Target]?;
            
            for target in module["targets"].arrayValue{
                if(targets == nil){
                    targets = [Target]();
                }
                if(target["section_id"] != nil && target["text"] != nil){
                    let _target = Target(sectionId: target["section_id"].stringValue, text: target["text"].stringValue);
                    targets?.append(_target);
                }
            }
            configSection.addModule(ModuleType.Navigation, targets: targets);
            break;
        default:
            break;
        }
    }
}
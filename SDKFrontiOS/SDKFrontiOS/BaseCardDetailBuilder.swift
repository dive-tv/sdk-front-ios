//
//  BaseCardDetailBuilder.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/09/16.
//  Copyright © 2016 Touchvie. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias completionBlockBuild = (CardDetail)->Void;
private typealias completionBlockGetCard = (CardData)->Void;

public class BaseCardDetailBuilder : NSObject{
    
    internal var styleConfig : JSON?;
    internal var dictSections = [String : ConfigSection]();
    
    // MARK: Init
    /**
     The initializer.
     
     - parameter styleConfig: This is optional, by default is nil. If the user wants a style for the CardDetail need to pass a json.
     
     - returns: self
     */
    init(styleConfig : JSON? = nil){
        super.init();
        self.styleConfig = styleConfig;
    }
    
    // MARK: Public Methods
    /**
     This method build a CardDetail with the modules and sections the user wants to show.
     When finished build the CardDetail this is returned by the completion.
     
     - parameter cardId:   The cardId to get the information of the card
     - parameter completionBlock: The completion with the CardDetail.
     */
    public func build(cardId : String, completionBlock : completionBlockBuild){
        self.getCardData(cardId) { (cardData : CardData) in
            // TODO: need to do the logic
        }
    }
    
    // MARK: Private Methods
    private func getCardData(cardId : String, completionBlock : completionBlockGetCard){
        // TODO: need to call the sdkclient and in the response call the completion
    }

}
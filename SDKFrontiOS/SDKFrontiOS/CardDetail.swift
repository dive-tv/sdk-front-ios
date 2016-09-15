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
    
    internal var sectionsData : [String:ConfigSection]!;
    internal var navigationController : UINavigationController!;
    
    internal var sectionsViewControllers = [String:UIViewController]();
    
    init(_sectionsData : [String:ConfigSection], _navigationController : UINavigationController) {
        
        self.sectionsData = _sectionsData;
        self.navigationController = _navigationController;
    }
    
    private func buildSections () {
        
        for sectionData in self.sectionsData {
            
        }
        
    }
}
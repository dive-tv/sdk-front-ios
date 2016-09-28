//
//  ScenesManager.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 20/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class SceneManager : NSObject {
    
    private var cardsByScene : [Int : [CarouselCard]]!;
    private var carruselLogic : CarouselLogic!;
    
    override init() {
        super.init();
        
        self.carruselLogic = CarouselLogic();
    }
    
    deinit {
        print("SCENE MANAGER DEINIT")
    }
    
}
//
//  Errors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

protocol ErrorManager {
    static func ThrowError(errorType : ErrorType) throws
    
    static func ShowError(errorType : ErrorType)
    
    static func UnreconigzedError()
   
}


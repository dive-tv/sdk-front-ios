//
//  CardDetailErrors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 13/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class CardDetailErrors : ErrorManager{
    
    private static var ErrorMessages : [String : String] = [
        "UnrecognizableError" : "ERROR: an unrecognizable error has occurredr"
    ]
    
    internal enum CreateCardDetailRenderErrors : ErrorType{
        case emptyData
        case invalidData
    }

    internal class func ThrowError(errorType : ErrorType) throws{
        throw errorType;
    }
    
    internal class func ShowError(errorType : ErrorType){
        print(ErrorMessages[String(errorType.self)]);
    }
    
    internal class func UnreconigzedError(){
        print(ErrorMessages["UnrecognizableError"])
    }
}

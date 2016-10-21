//
//  CarruselErrors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 30/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class CarruselErrors : ErrorManager{
    
    private static var ErrorMessages : [String : String] = [
        "UnrecognizableError" : "ERROR: an unrecognizable error has occurredr",
        "CreateGrouppableTreeError" : "ERROR: GrouppableTree data is invalid or empty!!",
    ]
    
    internal enum CreateGrouppableTreeErrors : ErrorType{
        case emptyData
        case invalidData
    }
    
    
    //MARK: ERROR MANAGER PROTOCOL IMPLEMENTATION
    internal class func ThrowError(errorType : ErrorType) throws{
        throw errorType;
    }
    
    internal class func ShowError(errorType : ErrorType){
        print(ErrorMessages[String(errorType.self)]);
        print(errorType);
    }
    
    internal class func UnreconigzedError(){
        print(ErrorMessages["UnrecognizableError"])
    }
}

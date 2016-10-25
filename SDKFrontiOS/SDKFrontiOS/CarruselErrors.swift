//
//  CarruselErrors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 30/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class CarruselErrors : ErrorManager{
    
    fileprivate static var ErrorMessages : [String : String] = [
        "UnrecognizableError" : "ERROR: an unrecognizable error has occurredr",
        "CreateGrouppableTreeError" : "ERROR: GrouppableTree data is invalid or empty!!",
    ]
    
    internal enum CreateGrouppableTreeErrors : Error{
        case emptyData
        case invalidData
    }
    
    
    //MARK: ERROR MANAGER PROTOCOL IMPLEMENTATION
    internal class func ThrowError(_ errorType : Error) throws{
        throw errorType;
    }
    
    internal class func ShowError(_ errorType : Error){
        print(ErrorMessages[String(describing: errorType.self)]);
        print(String(describing: errorType.self) + "." + String(describing: errorType));
    }
    
    internal class func UnreconigzedError(){
        print(ErrorMessages["UnrecognizableError"])
    }
}

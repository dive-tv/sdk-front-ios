//
//  DataModelErrors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 15/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class DataModelErrors : ErrorManager{
    
    private static var ErrorMessages : [String : String] = [
        "UnrecognizableError" : "ERROR: an unrecognizable error has occurred",
        "CreateCardDetailErrors" : "ERROR: The data for create CardDetail is invalid",
        "CreateImageErrors" : "ERROR: The data for create Image is invalid",
        "CreateSourceErrors" : "ERROR: The data for create Source is invalid",
        "CreateProductErrors" : "ERROR: The data for create Product is invalid",
        "CreateTextContainerErrors" : "ERROR: The data for create TextContainer is invalid"
    ]
    
    internal enum CreateCardDetailErrors : ErrorType{
        case invalidTypeOfCard
        case invalidData
        case emptyData
    }
    
    internal enum CreateImageErrors : ErrorType{
        case invalidData
        case emptyData
    }
    
    internal enum CreateSourceErrors : ErrorType{
        case invalidData
        case emptyData
    }
    
    internal enum CreateProductErrors : ErrorType{
        case invalidCategoryOfProduct
        case invalidData
        case emptyData
    }
    
    internal enum CreateTextContainerErrors : ErrorType{
        case invalidData
        case emptyData
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

//
//  DataModelErrors.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 15/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation

internal class DataModelErrors : ErrorManager{
    
    fileprivate static var ErrorMessages : [String : String] = [
        "UnrecognizableError" : "ERROR: an unrecognizable error has occurred",
        "CreateCardDetailErrors" : "ERROR: The data for create CardDetail is invalid",
        "CreateMiniCardErrors" : "ERROR: The data for create a MiniCard is invalid",
        "CreateImageErrors" : "ERROR: The data for create Image is invalid",
        "CreateSourceErrors" : "ERROR: The data for create Source is invalid",
        "CreateProductErrors" : "ERROR: The data for create Product is invalid",
        "CreateContainerErrors" : "ERROR: The data for create Container is invalid",
        "CreateContainerDataErrors" : "ERROR: The data for create ContainerData is invalid",
        "CreateRelationsErrors" : "ERROR: The data for create Relations is invalid",
        "CreateRelationsDataErrors" : "ERROR: The data for create RelationsData is invalid",
        "CreateSyncErrors" : "ERROR: The data for create Sync is invalid",
        "CreateTVEventErrors" : "ERROR: The data for create TVEvent is invalid",
        "CreateUserErrors" : "ERROR: The data for create User is invalid"
    ]
    
    internal enum CreateCardDetailErrors : Error{
        case invalidTypeOfCard
        case invalidData
        case emptyData
    }
    
    internal enum CreateMiniCardErrors : Error{
        case invalidTypeOfCard
        case invalidData
        case emptyData
    }
    
    internal enum CreateImageErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateSourceErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateProductErrors : Error{
        case invalidCategoryOfProduct
        case invalidData
        case emptyData
    }
    
    internal enum CreateContainerErrors : Error{
        case invalidContainerType
        case invalidContainerContentType
        case invalidData
        case emptyData
    }
    
    internal enum CreateContainerDataErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateRelationsErrors : Error{
        case invalidRelationType
        case invalidRelationContentType
        case invalidData
        case emptyData
    }
    
    internal enum CreateRelationsDataErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateSyncErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateTVEventErrors : Error{
        case invalidData
        case emptyData
    }
    
    internal enum CreateUserErrors : Error{
        case invalidData
        case emptyData
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

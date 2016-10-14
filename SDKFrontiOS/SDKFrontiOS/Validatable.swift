//
//  Validatable.swift
//  SDKFrontiOS
//
//  Created by Jonathan Castro Miguel on 30/09/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Validatable {
    associatedtype T;
    associatedtype R;
    static func validate(data : T) throws -> R
}

protocol JSONValidatable{
    static func validate(data : JSON) throws
}

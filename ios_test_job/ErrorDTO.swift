//
//  ErrorDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import ObjectMapper

class ErrorDTO: NSObject , Mappable {
    
    var error: String?
    var message: String?
    
    init(error: String, message: String, hint: String) {
        self.error = error
        self.message = message
    }
    
    init(jsonDict:NSDictionary) {
        error = jsonDict.object(forKey: "error") as? String
        message = jsonDict.object(forKey: "message") as? String
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        message <- map["message"]
    }
    
}


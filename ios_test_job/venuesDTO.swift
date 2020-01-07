//
//  VenuesDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import ObjectMapper

class VenuesDTO:NSObject, Mappable {
    
    var id:String?
    var name:String?
    var formattedAddress:[String]?
    
    required init?(map: Map) {

       }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        formattedAddress <- map["formattedAddress"]
    }
}

//
//  PlacesDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import ObjectMapper

class PlacesDTO:NSObject, Mappable {
    
    var response:ResponseDTO?
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        response <- map["response"]
    }

    
}

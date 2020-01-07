//
//  ResponseDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//


import UIKit
import ObjectMapper

class ResponseDTO:NSObject, Mappable {
    
    var venues:[VenuesDTO]?

    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        venues <- map["venues"]
    }
}

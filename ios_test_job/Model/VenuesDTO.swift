//
//  VenuesDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import SwiftyJSON

struct VenueDTO {
    var name: String
    var location: String
    var catIcon: String
    
    init() {
        name = ""
        location = ""
        catIcon = ""
    }
    
    init(response: JSON){
        name = response["name"].stringValue
        location = response["location"]["formattedAddress"].arrayValue.map({ $0.stringValue }).joined(separator: ",")
        if  let categorie = response["categories"].arrayValue.first?.dictionaryValue,
            let prefix = categorie["icon"]?["prefix"].stringValue,
            let suffix = categorie["icon"]?["suffix"].stringValue {
            catIcon = prefix + "64" + suffix
        } else {
            catIcon = ""
        }
    }
    
    func description() {
        print("name: \(name)")
        print("location: \(location)")
        print("cat icon: \(catIcon)")
    }
}


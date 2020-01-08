//
//  Location.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/8/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation

struct Location: Codable {
    let address: String?
    let latitude: Double
    let longitude: Double

    private enum CodingKeys: String, CodingKey {
        case address
        case latitude = "lat"
        case longitude = "lng"
    }
}

//
//  VenuesDTO.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit

struct VenuesDTO: Codable {
    let venueId: String
    let name: String
    let location: Location
    let categories: [VenueCategory]?

    private enum CodingKeys: String, CodingKey {
        case venueId = "id"
        case name
        case location
        case categories
    }
}

//
//  VenueCategory.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/8/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation

struct VenueCategory: Codable {
    let categoryId: String
    let name: String
    let icon: VenueCategoryIcon

    private enum CodingKeys: String, CodingKey {
        case categoryId = "id"
        case name
        case icon
    }
}

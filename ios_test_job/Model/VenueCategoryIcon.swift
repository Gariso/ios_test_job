//
//  VenueCategoryIcon.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/8/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation

struct VenueCategoryIcon: Codable {
    let prefix: String
    let suffix: String

    var categoryIconUrl: String {
        return String(format: "%@%d%@", prefix, 88, suffix)
    }
}

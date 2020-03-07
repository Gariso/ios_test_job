//
//  Worker.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Worker {
    // MARK: - Variable
    private let network = ApiPlacesManager()
    
    // MARK: - Function
    func getVenues(success: @escaping (_ venues: [VenueDTO]) -> Void,
                  fail: @escaping () -> Void) {
        network.getVenueExplore(completed: { response in
            if response["meta"]["code"].intValue == 200 {
                let group = response["response"]["groups"].arrayValue.first?.dictionaryValue
                let items = group?["items"]?.arrayValue
                let venues = items?.map({ VenueDTO(response: $0["venue"]) }) ?? []
                success(venues)
            } else {
                fail()
            }
        })
    }
    
}

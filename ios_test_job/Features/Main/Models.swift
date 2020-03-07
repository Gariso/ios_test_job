//
//  Models.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation


enum VC {
    enum GetVenues {
        struct Request {
            
        }
        
        struct Response {
            var venues: [VenueDTO]
        }
        
        struct ViewModel {
            struct DisplayVenue {
                var icon: String
                var name: String
                var address: String
                
            }
            
            var displayVenues: [DisplayVenue]
        }
    }
}

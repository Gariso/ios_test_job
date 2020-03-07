//
//  Interactor.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation

protocol BusinessLogic {
    func getVenues()
}

protocol DataStore {
    var venues: [VenueDTO]? { get }
}

class Interactor: BusinessLogic, DataStore {
    var presenter: PresentationLogic?
    var worker = Worker()
    var venues: [VenueDTO]?
    
    // MARK: - BusinessLogic
    func getVenues() {
        worker.getVenues(success: { venues in
            self.venues = venues
            let response = VC.GetVenues.Response(venues: venues)
            self.presenter?.presentGetVenuesSuccess(response: response)
        }, fail: {
            self.presenter?.presentGetVenuesFail()
        })
        
    }
}

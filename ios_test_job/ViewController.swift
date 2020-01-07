//
//  ViewController.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import Pilgrim

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        PilgrimManager.shared().start()
        PilgrimManager.shared().visitTester?.fireTestVisit(confidence: .medium, type: .venue, departure: false)

        PilgrimManager.shared().getCurrentLocation { (currentLocation, error) in
            let test = currentLocation?.currentPlace.venue?.name
            print("location",test)
        }
    }
    


}


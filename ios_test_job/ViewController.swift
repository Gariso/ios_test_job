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

    var urlData:String?
    
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
        
        ApiPlacesManager.getPlaces(success: { ([PlacesDTO]) in
            
        }) { (ErrorDTO) in
            
        }
        
//        ApiPlacesManager.getPlaces(success: { ([PlacesDTO]) in
//            print("PlacesDTO",PlacesDTO)
//        }) { (ErrorDTO) in
//
//        }
    }
    
    func getDataUrl(urlLoad:String) {

        guard let url = URL(string: urlData!) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
//            self.dailySales = [DailySales]()
            guard let data = data else { return }
            do {
                let dailySalesData = try JSONDecoder().decode([PlacesList].self, from: data)
                print("dailySalesData",dailySalesData)
                //Get back to the main queue
                DispatchQueue.main.async {
                    print(dailySalesData)
                }

            } catch let jsonError {
                print(jsonError)
                let alert = UIAlertController(title: "aaa", message: "Today, no sales yet.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { action in
                }))
                self.present(alert, animated: true, completion: nil)
            }
            }.resume()
    }

}


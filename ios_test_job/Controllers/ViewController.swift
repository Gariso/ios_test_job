//
//  ViewController.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import Pilgrim
import SDWebImage

struct Response <Response: Codable> : Codable {
    let response: Response
}

struct SearchResponse : Codable {
    let venues: [VenuesDTO]
}

class ViewController: UIViewController {

    
    
    @IBOutlet weak var placesListTableView: UITableView!
    
    var urlData:String?
    var accessToken = "QWINIP4JISRF10LIAPUIVJKDUWGZVSPZYHOYVGK1KTFUMOMP"
    var venues: [VenuesDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placesListTableView.delegate = self
        self.placesListTableView.dataSource = self
        
        
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        PilgrimManager.shared().start()
        PilgrimManager.shared().visitTester?.fireTestVisit(confidence: .medium, type: .venue, departure: false)

        PilgrimManager.shared().getCurrentLocation { (currentLocation, error) in
            let test = currentLocation?.currentPlace.venue?.name
            print("location",test)
        }
        
//        ApiPlacesManager.getPlaces(success: { ([PlacesDTO]) in
//
//        }) { (ErrorDTO) in
//
//        }
        
        
//        getData()
//        testApi()
        searchVenuesWithCoordinate { (error) in
            
        }

    }
    
    
    func searchVenuesWithCoordinate(completion: ((Error?) -> ())?) {

        
        let client = ApiPlacesManager(accessToken: accessToken)
        
        let parameter: [String: String] = [
            "ll": "40.7099,-73.9622",
        ];

        client.request(path: "venues/search", parameter: parameter) {
            [weak self] result in
            switch result {
            case let .success(data):
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Response<SearchResponse>.self, from: data)
                    self?.venues = response.response.venues
                    print("self?.venues",self?.venues)
                    self?.placesListTableView.reloadData()
                    completion?(nil)
                } catch {
                    completion?(error)
                }
            case let .failure(error):
                completion?(error)
            }
        }
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(venues.count)
        return self.venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = venues[indexPath.row].name
        cell.detailTextLabel?.text = venues[indexPath.row].location.address
        cell.imageView?.sd_cancelCurrentImageLoad()

        var categoryIconURL: URL? = nil
        if let categories = venues[indexPath.row].categories {
            if !categories.isEmpty {
                categoryIconURL = URL(string: categories[0].icon.categoryIconUrl)
            }
        }
        cell.imageView?.sd_setImage(with: categoryIconURL, placeholderImage: UIImage(named: "none"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index",indexPath)
    }
    
    
}


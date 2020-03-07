//
//  Router.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation

protocol DataPassing {
    var dataStore: DataStore? { get }
}

class Router: DataPassing {
    // MARK: - Variable
    weak var viewControler : ViewController?
    var dataStore: DataStore?
    
    // MARK: - Navigation
    func routetoDetail(index: Int) {
        if let venue = dataStore?.venues?[index] {
            let vc = Scene.datailPage.viewController() as! DetailViewController
            vc.icon = venue.catIcon
            vc.name = venue.name
            vc.address = venue.location
            viewControler?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

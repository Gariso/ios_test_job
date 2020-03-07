//
//  Scene+ViewController.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation
import UIKit

extension Scene {
    func viewController() -> UIViewController {
        let SBMain = UIStoryboard(name: "Main", bundle: nil)
        
        switch self {
        case .datailPage:
            let vc = SBMain.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            return vc
        }
    }
}

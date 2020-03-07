//
//  DetailViewController.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/27/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    // Mark: -  IBOutlet
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // Mark: - Variable
    var icon = ""
    var name = ""
    var address = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    iconImage.layer.cornerRadius = iconImage.layer.frame.height / 2
        
        iconImage.sd_setImage(with: URL(string: icon), completed: nil)
        nameLabel.text = name
        addressLabel.text = address
        
    }
    



}

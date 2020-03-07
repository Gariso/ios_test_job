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
import Alamofire
import SwiftyJSON

protocol DisplayLogic : class {
    func displayGetVenuesSuccess(viewModel: VC.GetVenues.ViewModel)
    func displayGetVenuesFail()
}

class ViewController: UIViewController, DisplayLogic {
    
    //Mark: - IBOutlet
    @IBOutlet weak var placesListTableView: UITableView!
    
    
    //Mark: -Variable
    let displayCell = "displayCell"
    var interactor: BusinessLogic?
    var router: Router?
    var displayVenues: [VC.GetVenues.ViewModel.DisplayVenue] = []
    var urlData:String?
    var accessToken = "QWINIP4JISRF10LIAPUIVJKDUWGZVSPZYHOYVGK1KTFUMOMP"
    var venues: [VenueDTO] = []
    
    
    //Mark: - Life Cycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placesListTableView.delegate = self
        self.placesListTableView.dataSource = self
        
        self.placesListTableView.register(UINib(nibName: "DisplayCell", bundle: nil), forCellReuseIdentifier: displayCell)
        
        
        interactor?.getVenues()
    }
    
    // MARK: - Function
    
    func displayGetVenuesSuccess(viewModel: VC.GetVenues.ViewModel) {
        displayVenues = viewModel.displayVenues
        self.placesListTableView.reloadData()
    }
    
    func displayGetVenuesFail() {
        print("Fail")
    }
    
    func configurator() {
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewControler = self
        router.dataStore = interactor
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(venues.count)
        return displayVenues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayCell, for: indexPath) as! DisplayCell
    
        let data = displayVenues[indexPath.row]
        cell.configureCell(icon: data.icon, name: data.name, address: data.address)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index",indexPath)
    }
    
    
}


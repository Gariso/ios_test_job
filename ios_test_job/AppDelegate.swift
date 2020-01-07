//
//  AppDelegate.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import Pilgrim

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        PilgrimManager.shared().configure(withConsumerKey: "EKONYSZG0B5LPGLZIMWFO1THXJ01P2HB0LJQXLRIIJIZ55V1", secret: "O5FF4EKZSSAPYFRW2V1GYXB0VVEA24GE5ZELSLTNQJSKKBQN", delegate: self, completion: nil)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate : PilgrimManagerDelegate {
  // Primary visit handler:
  func pilgrimManager(_ pilgrimManager: PilgrimManager, handle visit: Visit) {
    // Process the visit however you'd like:
    print("\(visit.hasDeparted ? "Departure from" : "Arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim visit at: \(visit.displayName)")
  }

  // Optional: If visit occurred without network connectivity
  func pilgrimManager(_ pilgrimManager: PilgrimManager, handleBackfill visit: Pilgrim.Visit) {
    // Process the visit however you'd like:
    print("Backfill \(visit.hasDeparted ? "departure from" : "arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim backfill visit at: \(visit.displayName)")
  }

  // Optional: If visit occurred by triggering a geofence
  func pilgrimManager(_ pilgrimManager: PilgrimManager, handle geofenceEvents: [GeofenceEvent]) {
    // Process the geofence events however you'd like. Here we loop through the potentially multiple geofence events and handle them individually:
    geofenceEvents.forEach { geofenceEvent in
      print(geofenceEvent)
    }
  }
}


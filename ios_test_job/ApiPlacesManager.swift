//
//  ApiPlacesManager.swift
//  ios_test_job
//
//  Created by Thananchai Pinyo on 1/7/20.
//  Copyright © 2020 Thananchai Pinyo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ApiPlacesManager {
    static func getPlaces(
                success: @escaping (_ canvasDTO: [PlacesDTO]) -> (),
                error: @escaping (_ errorDTO: ErrorDTO) -> ()) {
            let url = "https://api.foursquare.com/v2/venues/search?client_id=EKONYSZG0B5LPGLZIMWFO1THXJ01P2HB0LJQXLRIIJIZ55V1&client_secret=O5FF4EKZSSAPYFRW2V1GYXB0VVEA24GE5ZELSLTNQJSKKBQN&v=20200105&near=new york&intent=browse&radius=10000&query=peter luger steak house&limit=10"
    //        43702
            let headers = [
                "Content-Type": "application/json;charset=UTF-8"
//                "Secret": "9187029340140912349724912749102979141097459",
//                "Authorization": "bearer \(token)"
            ]
            
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseArray(completionHandler: {
                    (response: DataResponse<[PlacesDTO]>) in
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                    switch (response.result) {
                    case .success:
                        if let resultObject = response.result.value {
                            success(resultObject)
                        } else {
                            error(ErrorDTO(error: "unknown", message: "unknown", hint: "unknown"))
                        }
                        break
                    case .failure:
                        if let data =  response.data {
                            if let json = String(data: data, encoding:String.Encoding.utf8){
                                if let data = json.data(using: String.Encoding.utf8) {
                                    do {
                                        if let dict:NSDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                                            error(ErrorDTO(jsonDict: dict))
                                            break
                                        }
                                    } catch _ as NSError {
                                    }
                                }
                            }
                        }
                        error(ErrorDTO(error: "unknown", message: "unknown", hint: "unknown"))
                        break
                    }
                })
        }

}

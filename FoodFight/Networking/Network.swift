//
//  Network.swift
//  Food
//
//  Created by Daniel Li on 5/26/16.
//  Copyright © 2016 dantheli. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

var URL = "http://10.0.31.14:5000"

enum Router: URLStringConvertible {
    
    case UserCreate
    case UserAddPref
    case Play
    
    static let BackendHostURL =     URL
    
    var URLString: String {
        let path: String = {
            switch self {
            case .UserCreate:
                return "/users/create"
            case .UserAddPref:
                return "/users/add_pref"
            case .Play:
                return "/choices/recommend"
            }
        }()
        return Router.BackendHostURL + path
    }
}

struct APIKey {
    static let Success      = "success"
    static let Data         = "data"
    static let Errors       = "errors"
    
    static let Info         = "info"
}

var SessionCode: String? {
    get {
        return NSUserDefaults.standardUserDefaults().stringForKey("SessionCode")
    }
    set {
        NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "SessionCode")
    }
}


/**
 
 The NetworkManager class makes HTTP requests to the backend server.
 
 */
class Network {
    
    static var name: String = ""
    
    static var restaurants: [Restaurant]?
    
    static func signIn(name: String, email: String, completion: (error: NSError?) -> Void) {
        let parameters: [String : AnyObject] = [
            "user" : [
                "name" : name,
                "email" : email
            ]
        ]
        request(.POST, params: parameters, router: .UserCreate) { data, error in
            let restaurants = data?["training_data"].array?.map { Restaurant(json: $0) }
            self.name = name
            self.restaurants = restaurants
            completion(error: error)
        }
    }
    
    static func userPrefs(choice: Bool, index: Int, completion: (error: NSError?) -> Void) {
        let parameters: [String : AnyObject] = [
            "user" : [
                "name" : name
            ],
            "pref" : [
                "prefer" : choice,
                "business_id" : restaurants![index].id
            ]
        ]
        request(.POST, params: parameters, router: .UserAddPref) { data, error in
            completion(error: error)
        }
    }
    
    static func play(completion: (restaurant: Restaurant?) -> Void) {
        let parameters: [String : AnyObject] = [
            "users" : [
                ["name" : "joe"],
                ["name" : "ilan"],
                ["name" : "dan"]
            ],
            "choices" : [
                "chinese" : 0.6,
                "indian" : 0.05,
                "ice cream" : 0.1,
                "fast food" : 0.25
            ]
        ]
        request(.POST, params: parameters, router: .Play) { data, error in
            var restaurant: Restaurant? = nil
            restaurant = Restaurant(json: data!["suggestions"].arrayValue.first!)
            completion(restaurant: restaurant)
        }
    }
    
    private static func request(method: Alamofire.Method, params: [String: AnyObject], router: Router, encoding: ParameterEncoding = .JSON, completion: (data: JSON?, error: NSError?) -> Void) {
        Alamofire.request(method, router, encoding: encoding, parameters: params)
            .responseJSON { response in
                print()
                print("**************************************** NEW REQUEST *************************************")
                print()
                print("URL: " + router.URLString)
                print()
                print("PARAMETERS: \(params)")
                if let error = response.result.error {
                    print()
                    print("ERROR: (code: \(error.code)) \(error.localizedDescription)")
                    print()
                    completion(data: nil, error: error)
                    return
                }
                
                let json = JSON(data: response.data!)
                print()
                print("RESPONSE:")
                print()
                print(json)
                
                completion(data: json, error: nil)
        }
    }
    
}


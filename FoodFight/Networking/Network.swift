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

enum Router: URLStringConvertible {
    
    case Endpoint
    
    static let BackendHostURL =     "https://localhost/api/v1"
    
    var URLString: String {
        let path: String = {
            switch self {
            case .Endpoint:
                return "/endpoint"
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
    
    static func signIn(username: String, completion: (error: NSError?) -> Void) {
//        request(.POST, params: [], router: <#T##Router#>, completion: <#T##(data: JSON?, error: NSError?) -> Void#>)
        completion(error: nil)
    }
    
    static func someGetRequest(info: String, completion: (error: NSError?) -> Void) {
        request(.GET, params: [APIKey.Info : info], router: .Endpoint) { data, error in
            if error == nil {
                print("Data: \(data)")
            }
            completion(error: error)
        }
    }
    
    private static func request(method: Alamofire.Method, params: [String: AnyObject], router: Router, completion: (data: JSON?, error: NSError?) -> Void) {
        Alamofire.request(method, router, parameters: params)
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
                
                if json[APIKey.Success].bool! {
                    completion(data: json[APIKey.Data], error: nil)
                } else {
                    let error = json[APIKey.Data][APIKey.Errors].array?.first?.string
                    completion(data: nil, error: NSError(domain: "Domain", code: -999999, userInfo: [kCFErrorLocalizedDescriptionKey : error ?? "Unknown Error"]))
                }
        }
    }
    
    
    
}


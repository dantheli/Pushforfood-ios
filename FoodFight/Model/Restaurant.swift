//
//  Restaurant.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Restaurant {
    var name: String
    var cuisine: String
    var imageURL: String
    var id: String
    var address: String
    
    init(json: JSON) {
        id = json["business_id"].stringValue
        name = json["name"].stringValue
        imageURL = json["image_url"].stringValue
        address = json["full_address"].stringValue
        cuisine = json["categories"].arrayValue.first?.stringValue ?? "Food"
    }
}
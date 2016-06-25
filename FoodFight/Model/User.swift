//
//  User.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    var id: String
    
    var name: String
    var email: String
    
    init(json: JSON) {
        name = ""
        email = ""
        id = ""
    }
    
    init(name: String, email: String) {
        id = NSUUID().UUIDString
        self.name = name
        self.email = email
    }
}
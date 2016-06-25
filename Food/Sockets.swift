//
//  Sockets.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import Foundation
import SocketIOClientSwift

class Sockets {
    
    let sharedInstance = Sockets()
    private init() {    }
    
    var socket: SocketIOClient!
    
    func setup() {
        socket = SocketIOClient(socketURL: NSURL(string: "")!)
        socket.onAny { event in
            print("Got socket with event: \(event.event)")
        }
    }
    
}
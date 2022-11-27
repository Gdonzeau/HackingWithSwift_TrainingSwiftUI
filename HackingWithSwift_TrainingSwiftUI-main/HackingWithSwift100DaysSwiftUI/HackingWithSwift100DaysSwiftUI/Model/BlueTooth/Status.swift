//
//  Status.swift
//  BlueTooth Remote Control for Arduino
//
//  Created by Guillaume Donzeau on 14/12/2021.
//

import Foundation

class StatusNow {
    static let shared  = StatusNow()
    
enum Status {
    case disconnected
    case connecting
    case connected
    case error
}
}

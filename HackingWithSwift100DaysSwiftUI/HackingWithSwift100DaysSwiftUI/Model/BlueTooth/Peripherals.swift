//
//  Peripherals.swift
//  TestBluetooth_multiple_controllers
//
//  Created by Guillaume Donzeau on 26/01/2022.
//

import Foundation
import CoreBluetooth

struct PeripheralDetected {
    var name: String
    var peripheral: CBPeripheral
    var indentifier: UUID
}

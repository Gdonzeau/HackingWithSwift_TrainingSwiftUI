//
//  BluetoothConnectionDatas.swift
//  TestBluetooth_multiple_controllers
//
//  Created by Guillaume Donzeau on 25/01/2022.
//

import Foundation
import CoreBluetooth

class BluetoothPeripheral {
    static let shared = BluetoothPeripheral()
    
    var centralManager: CBCentralManager?
    var targetPeripheral: CBPeripheral!
    var writeCharacteristic: CBCharacteristic!
    var peripherals = [CBPeripheral]()
    var peripheralsDetected = [PeripheralDetected]()
}

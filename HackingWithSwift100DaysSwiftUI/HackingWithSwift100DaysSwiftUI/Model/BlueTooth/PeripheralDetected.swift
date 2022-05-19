//
//  PeripheralDetected.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import Foundation
import CoreBluetooth

struct PeripheralDetected: Identifiable {
    var id = UUID()
    var name: String
    var peripheral: CBPeripheral
    var indentifier: UUID
}

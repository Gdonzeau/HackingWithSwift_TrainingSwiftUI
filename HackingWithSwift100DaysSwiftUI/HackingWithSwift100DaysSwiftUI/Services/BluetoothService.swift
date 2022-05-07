//
//  BluetoothService.swift
//
//  Created by Guillaume Donzeau on 28/01/2022.
//

import Foundation
import CoreBluetooth

class BluetoothService: NSObject {
    
    static var shared = BluetoothService()
    var bluetoothPeripheral = BluetoothPeripheral.shared
    
    private var centralManager: CBCentralManager!
    
    var discoveredPeripherals = [CBPeripheral]()
    
    var messageReceived = ""
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScan() {
        centralManager.scanForPeripherals(withServices: [CBUUIDs.targetCBUUID], options: nil)
    }
    
    func connectBT(peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
     }
    func disconnect(peripheral: CBPeripheral) {
        centralManager.cancelPeripheralConnection(peripheral)
    }
    // Call after connecting to peripheral
    func discoverServices(peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
     
    // Call after discovering services
    func discoverCharacteristics(peripheral: CBPeripheral) {
        guard let services = peripheral.services else {
            return
        }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func discoverDescriptors(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.discoverDescriptors(for: characteristic)
    }
    
    func readValue(characteristic: CBCharacteristic) {
        self.bluetoothPeripheral.targetPeripheral.readValue(for: characteristic)
    }
    
    func sendOrder (message:String) {
        
            if let dataA = message.data(using: .utf8) {
                
                print("Sending : \(message)")
                bluetoothPeripheral.targetPeripheral?.writeValue(dataA, for: bluetoothPeripheral.writeCharacteristic, type: CBCharacteristicWriteType.withoutResponse)
            }
        
    }
    
    func actualize() {
        
        bluetoothPeripheral.peripheralsDetected = []
        centralManager?.scanForPeripherals(withServices: [CBUUIDs.targetCBUUID]) // replace by nil if you want to scan any peripheral
        
    }
}

extension BluetoothService: CBCentralManagerDelegate {
 
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOn:
                print("Let's scan")
                startScan()
            case .poweredOff:
                // Alert user to turn on Bluetooth
        print("Turn on BT")
            case .resetting:
                // Wait for next state update and consider logging interruption of Bluetooth service
        print("is reseting")
            case .unauthorized:
                // Alert user to enable Bluetooth permission in app Settings
        print("Not authorized")
            case .unsupported:
                // Alert user their device does not support Bluetooth and app will not work as expected
        print("Unsupported")
            case .unknown:
               // Wait for next state update
        print("Unknown")
        @unknown default:
            print("Fatal Error")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        self.discoveredPeripherals.append(peripheral)
        print("Trouvé : \(discoveredPeripherals)")
        
        if let nameTarget = peripheral.name {
            let peripheralDetected = PeripheralDetected(name: nameTarget, peripheral: peripheral, indentifier: peripheral.identifier)
                bluetoothPeripheral.peripheralsDetected.append(peripheralDetected)
        }
        
            let name = Notification.Name(rawValue: "BluetoothDiscovered")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Successfully connected. Store reference to peripheral if not already done.
        self.bluetoothPeripheral.targetPeripheral = peripheral
        peripheral.delegate = self
        
        let name = Notification.Name(rawValue: "BluetoothConnected")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
        
        bluetoothPeripheral.targetPeripheral.discoverServices([CBUUIDs.targetCBUUID])
        
    }
     
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        // Handle error
    }
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if error != nil {
            // Handle error
            return
        }
        // Successfully disconnected
    }
    
}

extension BluetoothService: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        guard peripheral.services != nil else {
            return
        }
        discoverCharacteristics(peripheral: peripheral)
    }
     
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        /*
        guard service.characteristics != nil else {
            return
        }
        */
        guard let characteristics = service.characteristics else { return }
        
        
        for characteristic in characteristics {
            
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
            for characteristic in service.characteristics!{
                let aCharacteristic = characteristic as CBCharacteristic
                if aCharacteristic.uuid == CBUUID(string: "FFE1"){
                    bluetoothPeripheral.writeCharacteristic = aCharacteristic
                }
            }
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        guard let descriptors = characteristic.descriptors else { return }
     
        // Get user description descriptor
        if let userDescriptionDescriptor = descriptors.first(where: {
            return $0.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString
        }) {
            // Read user description for characteristic
            peripheral.readValue(for: userDescriptionDescriptor)
        }
    }
     
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        // Get and print user description for a given characteristic
        if descriptor.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString,
            let userDescription = descriptor.value as? String {
            print("Characterstic \(String(describing: descriptor.characteristic?.uuid.uuidString)) is also known as \(userDescription)")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if error != nil {
            // Handle error
            return
        }
        guard characteristic.value != nil else {
            return
        }
        switch characteristic.uuid {
        
        case CBUUIDs.dialogCBUUID:
            // Send notification when datas received
            
            if let result = String( data: characteristic.value! , encoding: .utf8) {
                //print(result)
                messageReceived = result
                let name = Notification.Name(rawValue: "DatasReceivedFromBluetooth")
                let notification = Notification(name: name)
                NotificationCenter.default.post(notification)
            }
        default:
            print("Unhandled Characteristic UUID: \(characteristic.uuid)")
        }    }
}

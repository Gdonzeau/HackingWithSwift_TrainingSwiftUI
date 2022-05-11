//
//  Bluetooth.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 10/05/2022.
//

import SwiftUI
import CoreBluetooth
import Combine

struct PeripheralDetected: Identifiable {
    var id = UUID()
    var name: String
    var peripheral: CBPeripheral
    var indentifier: UUID
}

struct Bluetooth: View {
    let bluetoothServices = BluetoothService.shared
    let bluetoothPeripherals = BluetoothPeripheral.shared
    
    //@Published var peripherals: [CBPeripheral] = []
    
    @State private var combien = 0
    
    @State private var bluetoothDetected = BluetoothPeripheral.shared.peripheralsDetected
    @State private var peripheralDetected = BluetoothService.shared.discoveredPeripherals
    @State private var numberOfBluetoothDetected = BluetoothService.shared.discoveredPeripherals.count
    @State private var detected = BluetoothService.shared.bluetoothPeripheral.peripheralsDetected
    @State private var howMany = BluetoothService.shared.bluetoothPeripheral.peripheralsDetected.count
    var body: some View {
        VStack {
        Button("bluetooth Detection") {
            bluetoothServices.start()
        }
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(9)
        
        Text("Nombre : \(numberOfBluetoothDetected)")
            
        List(peripheralDetected, id: \.identifier) { peripheral in
            
            HStack {
                if let peripheralName = peripheral.name {
                    Text("Nom du périph : \(peripheralName)")
                } else {
                    Text("Unknown")
                        .opacity(0.2)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .contentShape(Rectangle())
        }
        /*
        ForEach(peripheralDetected, id: \.self) { peripheral in
            Text("\(String(peripheral))")
                .padding()
        }
         */
    }
    }
}

struct Bluetooth_Previews: PreviewProvider {
    static var previews: some View {
        Bluetooth()
    }
}

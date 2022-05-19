//
//  Bluetooth.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 10/05/2022.
//

import SwiftUI
import CoreBluetooth
import Combine

struct Bluetooth: View {
    
    @StateObject var bluetooth = BluetoothService()
    
    @State private var color = "A"
    @State private var colors = ["A", "B", "C", "D", "E", "F", "H"]
    @State private var channel = "CIB01"
    @State private var channels = ["CIB01", "CIB02", "CIB03", "CIB04", "CIB05"]
    @State private var combien = 0
    
    var body: some View {
        
        Button("bluetooth Detection") {
            bluetooth.start()
        }
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(9)
        
        ForEach(bluetooth.bluetoothPeripheral.peripheralsDetected) { peripheral in
            
            HStack {
                if let peripheralName = peripheral.name {
                    Button("Nom du périph : \(peripheralName)") {
                        bluetooth.connectBT(peripheral: peripheral.peripheral)
                    }
                } else {
                    Text("Unknown")
                        .opacity(0.2)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .contentShape(Rectangle())
        }
        VStack {
            Text("Messages reçus : \(bluetooth.messageReceived)")
            Picker("Cible", selection: $channel) {
                ForEach(channels, id:\.self) {
                    Text($0)
                }
            }
            Picker("Couleur", selection: $color) {
                ForEach(colors, id:\.self) {
                    Text($0)
                }
            }
            Button("Send") {
                let message = light(targetChannel: channel, colorToLight: color)
                bluetooth.sendOrder(message: message)
            }
            .padding()
        }
        
    }
    /*
     Colors :
     A : Rouge
     B : Bleu
     C : Vert
     D : Blanc
     E : Jaune
     F : Cyan
     G : Violet
     H : Off
     */
    func light(targetChannel: String, colorToLight: String) -> String {
        //timer = Timer.scheduledTimer(timeInterval: 0.20, target: self, selector: #selector(reseting), userInfo: nil, repeats: true)
        let message = targetChannel + ":A:" + colorToLight + ":a:a:0:"
        return message
    }
}

struct Bluetooth_Previews: PreviewProvider {
    static var previews: some View {
        Bluetooth()
    }
}

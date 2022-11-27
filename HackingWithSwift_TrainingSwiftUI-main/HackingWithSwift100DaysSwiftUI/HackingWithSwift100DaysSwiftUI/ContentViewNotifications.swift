//
//  ContentViewNotifications.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 30/08/2022.
//

import SwiftUI
import UserNotifications

struct ContentViewNotifications: View {
    var body: some View {
        VStack {
            Button("Resquest Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                        testSuffix()
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func testSuffix() {
        let str = "https://auvio-web-main.vercel.app/live/411987"
        if let index = str.lastIndex(of: "/") {
            let result = str.suffix(from: index)
            let resourceId = result.suffix(result.count - 1)
            print(resourceId)
            
        }
    }
}



struct ContentViewNotifications_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNotifications()
    }
}

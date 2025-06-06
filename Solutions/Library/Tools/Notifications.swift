//
//  Energy
//
//  Created by Alex Kozin
//  Copyright © 2021 El Machine. All rights reserved.
//

import UIKit.UIApplication
import UserNotifications

class Notifications: NSObject {

    func registerForPushNotifications() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self


        center.requestAuthorization(options: [.alert, .sound, .badge, .provisional]) { g, _ in
            guard g == true else {
                return
            }
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func didReceive(token: Data) {
//        let string2: String = token | ("", {
//            $0 + String(format: "%02.2hhx", $1)
//        })


        let string2: String = token.reduce("", {
            $0 + String(format: "%02.2hhx", $1)
        })
        
        print(string2)
    }

}

extension Notifications: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        [.banner, .sound, .badge]
    }

}

//
//  CustomNotificationController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 24/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class CustomNotificationController: WKInterfaceController {
    
    @IBOutlet var picker: WKInterfacePicker!
    var pickerItems : [WKPickerItem] = []

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        for seconds in 5...10 {
            let pickerItem = WKPickerItem()
            pickerItem.title = "\(seconds) seconds"
            
            pickerItems.append(pickerItem)
        }
        
        picker.setItems(pickerItems)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerChanged(_ value: Int) {
        print("\(value)")
    }
    
    
    @IBAction func startClick() {
        
        let content = UNMutableNotificationContent()
        content.body = "corpo da notificação"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
       
        let request = UNNotificationRequest(identifier: "start", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error == nil {
                print("enviado com sucesso")
            } else {
                print("erro ao enviar not: \(error?.localizedDescription)")
            }
        }
    }
    

}

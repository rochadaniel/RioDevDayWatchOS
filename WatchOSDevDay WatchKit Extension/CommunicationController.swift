//
//  CommunicationController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class CommunicationController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func sendText() {
        presentTextInputController(withSuggestions: ["Teste1", "Teste2"], allowedInputMode: .allowAnimatedEmoji) { obj in
            if let result = obj {
                let msg: String = (result as! [String]).map { $0 }.joined(separator: " ")
                
                WCSession.default().sendMessage(["message": msg], replyHandler: { obj in
                        print(obj["resp"])
                    }, errorHandler: { error in
                        print(error.localizedDescription)
                })
            }
        }
    }
}

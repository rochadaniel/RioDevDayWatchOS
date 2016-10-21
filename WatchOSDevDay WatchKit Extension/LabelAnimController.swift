//
//  LabelAnimController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation


class LabelAnimController: WKInterfaceController {

    @IBOutlet var spaceGroup: WKInterfaceGroup!
    @IBOutlet var myLabel: WKInterfaceLabel!
    
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

    @IBAction func animClick() {
        animate(withDuration: 0.8) {
            self.spaceGroup.setWidth(0)
        }
    }
    
    @IBAction func resetClick() {
        self.spaceGroup.setWidth(120)
    }
    
}

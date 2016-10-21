//
//  MyNavigationController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation


class MyNavigationController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let params = context as? [String] {
                label.setText(params[0])
        }
        
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
    
    @IBAction func buttonClick() {
        //Chama uma nova tela (modal)
        presentController(withNames: ["pagebased1", "pagebased2"], contexts: nil)
    }
    

}

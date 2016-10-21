//
//  InterfaceController.swift
//  WatchOSDevDay WatchKit Extension
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    
    let myArray: [String] = ["Navigation", "Animations", "Communication", "Notifications"]
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        myTable.setNumberOfRows(myArray.count, withRowType: "myTableRow")
        
        for index in 0..<myArray.count {
            if let rowController = myTable.rowController(at: index) as? MyTableRowController {
                rowController.label.setText(myArray[index])
            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
